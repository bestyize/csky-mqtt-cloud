#include "my_dht11.h"
#include "drv_gpio.h"
#include "pin_name.h"
#include "delay.h"
#include "string.h"
#include "stdio.h"
#ifndef NULL
#  define NULL ((void *)0)
#endif

uint8_t temperature_value=10;
uint8_t humidity_value=10;
/**
 * DHT11的数据引脚
 * */
#define DHT11_DATA_PIN PA8


static gpio_pin_handle_t dht_pin_handle;

static void DHT11_IO_IN()
{
	csi_gpio_pin_config(dht_pin_handle,GPIO_MODE_PULLUP,GPIO_DIRECTION_INPUT);
}

static void DHT11_IO_OUT()
{
	csi_gpio_pin_config(dht_pin_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
}

static void DHT11_DQ_OUT(bool status)
{
	csi_gpio_pin_config(dht_pin_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_write(dht_pin_handle,status);
}

static bool DHT11_DQ_IN()
{
	bool values;
	csi_gpio_pin_read(dht_pin_handle,&values);
	return values;
}

//复位DHT11
static void DHT11_Rst(void)	   
{                 
	DHT11_IO_OUT(); 	//SET OUTPUT
    DHT11_DQ_OUT(0); 	//拉低DQ
    mdelay(20);    	//拉低至少18ms
    DHT11_DQ_OUT(1); 	//DQ=1 
	delay_us(30);     	//主机拉高20~40us
}
//等待DHT11的回应
//返回1:未检测到DHT11的存在
//返回0:存在
static uint8_t DHT11_Check(void) 	   
{   
	uint8_t retry=0;
	DHT11_IO_IN();//SET INPUT	 
    while (DHT11_DQ_IN()&&retry<100)//DHT11会拉低40~80us
	{
		retry++;
		delay_us(1);
	};	 
	if(retry>=100)return 1;
	else retry=0;
    while (!DHT11_DQ_IN()&&retry<100)//DHT11拉低后会再次拉高40~80us
	{
		retry++;
		delay_us(1);
	};
	if(retry>=100)return 1;	    
	return 0;
}
//从DHT11读取一个位
//返回值：1/0
static uint8_t DHT11_Read_Bit() 			 
{
 	uint8_t retry=0;
	while(DHT11_DQ_IN()&&retry<100)//等待变为低电平
	{
		retry++;
		delay_us(1);
	}
	retry=0;
	while(!DHT11_DQ_IN()&&retry<100)//等待变高电平
	{
		retry++;
		delay_us(1);
	}
	delay_us(40);//等待40us
	if(DHT11_DQ_IN())
	{
		return 1;
	}else{
		return 0;		
	}    
}


//从DHT11读取一个字节
//返回值：读到的数据
static uint8_t DHT11_Read_Byte(void)    
{        
    uint8_t i,dat;
    dat=0;
	for (i=0;i<8;i++) 
	{
   		dat<<=1; 
	    dat|=DHT11_Read_Bit();
    }						    
    return dat;
}
//从DHT11读取一次数据
//temp:温度值(范围:0~50°)
//humi:湿度值(范围:20%~90%)
//返回值：0,正常;1,读取失败
static uint8_t DHT11_Read_Data(uint8_t *temp,uint8_t *humi)    
{        
 	uint8_t buf[5];
	uint8_t i;
	DHT11_Rst();
	if(DHT11_Check()==0)
	{
		for(i=0;i<5;i++)//读取40位数据
		{
			buf[i]=DHT11_Read_Byte();
		}
		if((buf[0]+buf[1]+buf[2]+buf[3])==buf[4])
		{
			*humi=buf[0];
			*temp=buf[2];
		}
	}else{
		return 1;
	} 
	return 0;	    
}

static uint8_t DHT11_Init()
{
	gpio_pin_handle_t handle;
	handle=csi_gpio_pin_initialize(DHT11_DATA_PIN,NULL);
	dht_pin_handle=handle;
	csi_gpio_pin_config(dht_pin_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_write(dht_pin_handle,1);
	DHT11_Rst();
	return DHT11_Check();
}


/*
 * Author 		:yize
 * Date   		:
 * Function		:DHT11初始化
 * */
uint8_t my_dht11_init()
{
	uint8_t i=0;
	while(DHT11_Init())	//DHT11初始化	
	{
		if(i>6)
		{
			break;
		}
		i++;
 		mdelay(300);
	}	
	return 0;
}

//返回的格式应该是 "dht:status:temp 32.5 humi 67"其中"dht:status:"分是固定的
void get_temp_humi(char data[])
{
	uint8_t temperature=0,humidity=0;
	memset(data,0,40);
	//acquire temp and humi then format it
	DHT11_Read_Data(&temperature,&humidity);
	if(temperature>100||humidity>100)
	{
		temperature=0;
		humidity=0;
	}
	temperature_value=temperature;
	humidity_value=humidity;
	sprintf(data,"dht:status:tmp %d hum %d",temperature,humidity);
}