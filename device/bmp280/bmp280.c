#include <math.h>
#include "stdbool.h"

#include "bmp280_interface.h"
#include "bmp280.h"



/*
*作者：亦泽
*QQ  ：3011429848
*时间：2019-5-20
*纯软件实现BMP280驱动，移植的话只需要实现一下bmp280_interface.c里面的接口
*一个作为SCL线，一个作为SDA线
*SCL线需要实现写0和写1
*SDA线需要实现写0写1以及读取功能
*/


/*bmp280 气压和温度过采样 工作模式*/
#define BMP280_PRESSURE_OSR			(BMP280_OVERSAMP_8X)
#define BMP280_TEMPERATURE_OSR		(BMP280_OVERSAMP_16X)
#define BMP280_MODE					(BMP280_PRESSURE_OSR<<2|BMP280_TEMPERATURE_OSR<<5|BMP280_NORMAL_MODE)


typedef struct 
{
    uint16_t dig_T1;                                                                /* calibration T1 data */
    int16_t dig_T2;                                                                /* calibration T2 data */
    int16_t dig_T3;                                                                /* calibration T3 data */
    uint16_t dig_P1;                                                                /* calibration P1 data */
    int16_t dig_P2;                                                                /* calibration P2 data */
    int16_t dig_P3;                                                                /* calibration P3 data */
    int16_t dig_P4;                                                                /* calibration P4 data */
    int16_t dig_P5;                                                                /* calibration P5 data */
    int16_t dig_P6;                                                                /* calibration P6 data */
    int16_t dig_P7;                                                                /* calibration P7 data */
    int16_t dig_P8;                                                                /* calibration P8 data */
    int16_t dig_P9;                                                                /* calibration P9 data */
    int32_t t_fine;                                                                /* calibration t_fine data */
} bmp280Calib;

bmp280Calib  bmp280Cal;

static uint8_t bmp280ID=0;
static bool isInit=false;
static int32_t bmp280RawPressure=0;
static int32_t bmp280RawTemperature=0;

static void bmp280GetPressure(void);
static void presssureFilter(float* in,float* out);
static float bmp280PressureToAltitude(float* pressure/*, float* groundPressure, float* groundTemp*/);


//产生IIC起始信号
static void IIC_Start(void)
{
	bmp_sda_pin_out(1);
	bmp_scl_pin_out(1);
	bmp_delay_us(4);
	bmp_sda_pin_out(0);                                                              //START:when CLK is high,DATA change form high to low 
	bmp_delay_us(4);
	bmp_scl_pin_out(0);                                                                 //钳住I2C总线，准备发送或接收数据 
}	  
//产生IIC停止信号
static void IIC_Stop(void)
{
	bmp_sda_pin_out(0);                                                              //sda线输出
	bmp_scl_pin_out(0);                                                             //STOP:when CLK is high DATA change form low to high
 	bmp_delay_us(4);
	bmp_scl_pin_out(1); 
    bmp_sda_pin_out(1);                                                               //发送I2C总线结束信号
	bmp_delay_us(4);							   	
}
//等待应答信号到来
//返回值：1，接收应答失败
//        0，接收应答成功
static uint8_t IIC_Wait_Ack(void)
{
	uint8_t ucErrTime=0;
//	SDA_IN();                                                                  //SDA设置为输入  
//	bmp_sda_pin_read();
//	IIC_SDA=1;
	bmp_delay_us(1);	   
	bmp_scl_pin_out(1);
	bmp_delay_us(1);	 
	while(bmp_sda_pin_read())
	{
		ucErrTime++;
		if(ucErrTime>250)
		{
			IIC_Stop();
			return 1;
		}
	}
	bmp_scl_pin_out(0);                                                                 //时钟输出0 	   
	return 0;  
} 
//产生ACK应答
static void IIC_Ack(void)
{
	bmp_scl_pin_out(0);
    bmp_sda_pin_out(0);
	bmp_delay_us(2);
	bmp_scl_pin_out(1);
	bmp_delay_us(2);
	bmp_scl_pin_out(0);
}
//不产生ACK应答		    
static void IIC_NAck(void)
{
	bmp_scl_pin_out(0);
    bmp_sda_pin_out(1);
	bmp_delay_us(2);
	bmp_scl_pin_out(1);
	bmp_delay_us(2);
	bmp_scl_pin_out(0);
}					 				     
//IIC发送一个字节
//返回从机有无应答
//1，有应答
//0，无应答			  
static void IIC_Send_Byte(uint8_t txd)
{                        
    uint8_t t;   
    bmp_sda_pin_out(1);   
    bmp_scl_pin_out(0);                                                                 //拉低时钟开始数据传输
    for(t=0;t<8;t++)
    {              
        bmp_sda_pin_out((txd&0x80)>>7);
        txd<<=1; 	  
		bmp_delay_us(2);                                                           //对TEA5767这三个延时都是必须的
		bmp_scl_pin_out(1);
		bmp_delay_us(2); 
		bmp_scl_pin_out(0);	
		bmp_delay_us(2);
    }	 
} 	    
//读1个字节，ack=1时，发送ACK，ack=0，发送nACK   
static uint8_t IIC_Read_Byte(unsigned char ack)
{
	unsigned char i,receive=0;
    bmp_sda_pin_read();                                                                //SDA设置为输入
    for(i=0;i<8;i++ )
	{
        bmp_scl_pin_out(0); 
        bmp_delay_us(2);
		bmp_scl_pin_out(1);
        receive<<=1;
        if(bmp_sda_pin_read())receive++;   
		bmp_delay_us(1); 
    }					 
    if (!ack)
        IIC_NAck();                                                            //发送nACK
    else
        IIC_Ack();                                                             //发送ACK   
    return receive;
}

//从指定地址读出一个数据
//ReadAddr:开始读数的地址  
//返回值  :读到的数据
static uint8_t iicDevReadByte(uint8_t devaddr,uint8_t addr)
{				  
	uint8_t temp=0;		  	    																 
	IIC_Start();  
	IIC_Send_Byte(devaddr);                                                    //发送器件写命令 	   
	IIC_Wait_Ack(); 
	IIC_Send_Byte(addr);                                                       //发送低地址
	IIC_Wait_Ack();	

	IIC_Start();  	 	   
	IIC_Send_Byte(devaddr|1);                                                  //发送器件读命令			   
	IIC_Wait_Ack();	 
	temp=IIC_Read_Byte(0);			   
	IIC_Stop();                                                                //产生一个停止条件	    
	return temp;
}

//连续读多个字节
//addr:起始地址
//rbuf:读数据缓存
//len:数据长度
static void iicDevRead(uint8_t devaddr,uint8_t addr,uint8_t len,uint8_t *rbuf)
{
	int i=0;
	IIC_Start();  
	IIC_Send_Byte(devaddr);  
	IIC_Wait_Ack();	
	IIC_Send_Byte(addr);                                                       //地址自增  
	IIC_Wait_Ack();	

	IIC_Start();  	
	IIC_Send_Byte(devaddr|1);  	
	IIC_Wait_Ack();	
	for(i=0; i<len; i++)
	{
		if(i==len-1)
		{
			rbuf[i]=IIC_Read_Byte(0);                                          //最后一个字节不应答
		}
		else
			rbuf[i]=IIC_Read_Byte(1);
	}
	IIC_Stop( );	
}

//从指定地址写入一个数据
//WriteAddr :写入数据的目的地址    
//DataToWrite:要写入的数据
static void iicDevWriteByte(uint8_t devaddr,uint8_t addr,uint8_t data)
{				   	  	    																 
	IIC_Start();  
	IIC_Send_Byte(devaddr);                                                    //发送器件写命令 	 
	IIC_Wait_Ack();	   
	IIC_Send_Byte(addr);                                                       //发送低地址
	IIC_Wait_Ack(); 	 										  		   
	IIC_Send_Byte(data);                                                       //发送字节							   
	IIC_Wait_Ack();  		    	   
	IIC_Stop();		                                                           //产生一个停止条件 	 
}

//连续写多个字节
//addr:起始地址
//wbuf:写数据缓存
//len:数据的长度
//static void iicDevWrite(uint8_t devaddr,uint8_t addr,uint8_t len,uint8_t *wbuf)
//{
//	int i=0;
//	IIC_Start();  
//	IIC_Send_Byte(devaddr);  	
//	IIC_Wait_Ack();	
//	IIC_Send_Byte(addr);  //地址自增
//	IIC_Wait_Ack();	
//	for(i=0; i<len; i++)
//	{
//		IIC_Send_Byte(wbuf[i]);  
//		IIC_Wait_Ack();		
//	}
//	IIC_Stop( );	
//}





static void bmp280GetPressure(void)
{
    uint8_t data[BMP280_DATA_FRAME_SIZE];

    // read data from sensor
    iicDevRead(BMP280_ADDR,BMP280_PRESSURE_MSB_REG,BMP280_DATA_FRAME_SIZE,data);
    bmp280RawPressure=(int32_t)((((uint32_t)(data[0]))<<12)|(((uint32_t)(data[1]))<<4)|((uint32_t)data[2]>>4));
    bmp280RawTemperature=(int32_t)((((uint32_t)(data[3]))<<12)|(((uint32_t)(data[4]))<<4)|((uint32_t)data[5]>>4));
}

// Returns temperature in DegC, resolution is 0.01 DegC. Output value of "5123" equals 51.23 DegC
// t_fine carries fine temperature as global value
static int32_t bmp280CompensateT(int32_t adcT)
{
    int32_t var1,var2,T;

    var1=((((adcT>>3)-((int32_t)bmp280Cal.dig_T1<<1)))*((int32_t)bmp280Cal.dig_T2))>>11;
    var2=(((((adcT>>4)-((int32_t)bmp280Cal.dig_T1))*((adcT>>4)-((int32_t)bmp280Cal.dig_T1)))>>12)*((int32_t)bmp280Cal.dig_T3))>>14;
    bmp280Cal.t_fine=var1+var2;
	
    T=(bmp280Cal.t_fine*5+128)>>8;

    return T;
}

// Returns pressure in Pa as unsigned 32 bit integer in Q24.8 format (24 integer bits and 8 fractional bits).
// Output value of "24674867" represents 24674867/256 = 96386.2 Pa = 963.862 hPa
static uint32_t bmp280CompensateP(int32_t adcP)
{
    int64_t var1,var2,p;
    var1=((int64_t)bmp280Cal.t_fine)-128000;
    var2=var1*var1*(int64_t)bmp280Cal.dig_P6;
    var2=var2+((var1*(int64_t)bmp280Cal.dig_P5)<<17);
    var2=var2+(((int64_t)bmp280Cal.dig_P4)<<35);
    var1=((var1*var1*(int64_t)bmp280Cal.dig_P3)>>8)+((var1*(int64_t)bmp280Cal.dig_P2)<<12);
    var1=(((((int64_t)1)<<47)+var1))*((int64_t)bmp280Cal.dig_P1)>>33;
    if (var1==0)
        return 0;
    p=1048576-adcP;
    p=(((p<<31)-var2)*3125)/var1;
    var1=(((int64_t)bmp280Cal.dig_P9)*(p>>13)*(p>>13))>>25;
    var2=(((int64_t)bmp280Cal.dig_P8)*p)>>19;
    p=((p+var1+var2)>>8)+(((int64_t)bmp280Cal.dig_P7)<<4);
    return(uint32_t)p;
}

#define FILTER_NUM	5
#define FILTER_A	0.1f

/*限幅平均滤波法*/
static void presssureFilter(float* in,float* out)
{	
	static uint8_t i=0;
	static float filter_buf[FILTER_NUM]={0.0};
	double filter_sum=0.0;
	uint8_t cnt=0;	
	float deta;

	if(filter_buf[i]==0.0f)
	{
		filter_buf[i]=*in;
		*out=*in;
		if(++i>=FILTER_NUM)	
			i=0;
	} 
	else 
	{
		if(i)
			deta=*in-filter_buf[i-1];
		else 
			deta=*in-filter_buf[FILTER_NUM-1];
		
		if(fabs(deta)<FILTER_A)
		{
			filter_buf[i]=*in;
			if(++i>=FILTER_NUM)	
				i=0;
		}
		for(cnt=0;cnt<FILTER_NUM;cnt++)
		{
			filter_sum+=filter_buf[cnt];
		}
		*out=filter_sum /FILTER_NUM;
	}
}

#define CONST_PF 0.1902630958	                                               //(1/5.25588f) Pressure factor
#define FIX_TEMP 25				                                               // Fixed Temperature. ASL is a function of pressure and temperature, but as the temperature changes so much (blow a little towards the flie and watch it drop 5 degrees) it corrupts the ASL estimates.
								                                               // TLDR: Adjusting for temp changes does more harm than good.
/*
 * Converts pressure to altitude above sea level (ASL) in meters
*/
static float bmp280PressureToAltitude(float* pressure/*, float* groundPressure, float* groundTemp*/)
{
    if (*pressure>0)
    {
        return((pow((1015.7f/ *pressure),CONST_PF)-1.0f)*(FIX_TEMP+273.15f))/0.0065f;
    }
    else
    {
        return 0;
    }
}

bool bmp280_init(void)
{	
    if (isInit)
	{
		return true;
	}
	bmp280_pin_init();		                                                           /*初始化I2C*/
    bmp_delay_ms(20);
	
	bmp280ID=iicDevReadByte(BMP280_ADDR,BMP280_CHIP_ID);	                   /* 读取bmp280 ID*/
	
	if(bmp280ID!=BMP280_DEFAULT_CHIP_ID)
	{
		return false;
	}
    /* 读取校准数据 */
    iicDevRead(BMP280_ADDR,BMP280_TEMPERATURE_CALIB_DIG_T1_LSB_REG,24,(uint8_t *)&bmp280Cal);	
	iicDevWriteByte(BMP280_ADDR,BMP280_CTRL_MEAS_REG,BMP280_MODE);
	iicDevWriteByte(BMP280_ADDR,BMP280_CONFIG_REG,5<<2);		               /*配置IIR滤波*/
    isInit=true;
    return true;
}


void bmp280_get_data(float* pressure,float* temperature,float* asl)
{
    static float t;
    static float p;
	
	bmp280GetPressure();

	t=bmp280CompensateT(bmp280RawTemperature)/100.0;		
	p=bmp280CompensateP(bmp280RawPressure)/25600.0;		

	presssureFilter(&p,pressure);
	*temperature=(float)t;                                                     /*单位度*/
//	*pressure=(float)p ;	                                                   /*单位hPa*/	
	
	*asl=bmp280PressureToAltitude(pressure);	                               /*转换成海拔*/	
}
