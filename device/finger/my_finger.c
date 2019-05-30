#include "my_finger.h"
#include "drv_gpio.h"
#include "drv_usart.h"
#include "delay.h"
#include "stdint.h"

#include "stdio.h"
#include "string.h"

char local_date=0,base_date=0;//全局变量，当前箭头位置


uint8_t FPM10A_RECEICE_BUFFER[32];
unsigned int finger_id = 0;

//FINGERPRINT通信协议定义

uint8_t FPM10A_Get_Device[10] ={0x01,0x00,0x07,0x13,0x00,0x00,0x00,0x00,0x00,0x1b};//口令验证
uint8_t FPM10A_Pack_Head[6] = {0xEF,0x01,0xFF,0xFF,0xFF,0xFF};  //协议包头
uint8_t FPM10A_Get_Img[6] = {0x01,0x00,0x03,0x01,0x00,0x05};    //获得指纹图像
uint8_t FPM10A_Get_Templete_Count[6] ={0x01,0x00,0x03,0x1D,0x00,0x21 }; //获得模版总数
uint8_t FPM10A_Search[11]={0x01,0x00,0x08,0x04,0x01,0x00,0x00,0x03,0xE7,0x00,0xF8}; //搜索指纹搜索范围0 - 999,使用BUFFER1中的特征码搜索
uint8_t FPM10A_Search_0_9[11]={0x01,0x00,0x08,0x04,0x01,0x00,0x00,0x00,0x13,0x00,0x21}; //搜索0-9号指纹
uint8_t FPM10A_Img_To_Buffer1[7]={0x01,0x00,0x04,0x02,0x01,0x00,0x08}; //将图像放入到BUFFER1
uint8_t FPM10A_Img_To_Buffer2[7]={0x01,0x00,0x04,0x02,0x02,0x00,0x09}; //将图像放入到BUFFER2
uint8_t FPM10A_Reg_Model[6]={0x01,0x00,0x03,0x05,0x00,0x09}; //将BUFFER1跟BUFFER2合成特征模版
uint8_t FPM10A_Delete_All_Model[6]={0x01,0x00,0x03,0x0d,0x00,0x11};//删除指纹模块里所有的模版
volatile uint8_t  FPM10A_Save_Finger[9]={0x01,0x00,0x06,0x06,0x01,0x00,0x0B,0x00,0x19};//将BUFFER1中的特征码存放到指定的位置
//volatile:系统总是重新从它所在的内存读取数据，即使它前面的指令刚刚从该处读取过数据
/*------------------ FINGERPRINT命令字 --------------------------*/
 //发送包头
void FPM10A_Cmd_Send_Pack_Head(void)
{
	int i;	
	for(i=0;i<6;i++) //包头
   {
     my_finger_send_char(FPM10A_Pack_Head[i]);  
     //csi_usart_putchar(finger_handle,FPM10A_Pack_Head[i]); 
    }		
}
//发送指令
void FPM10A_Cmd_Check(void)
{
	int i=0;
	FPM10A_Cmd_Send_Pack_Head(); //发送通信协议包头
	for(i=0;i<10;i++)
	 {		
		my_finger_send_char(FPM10A_Get_Device[i]);
	  }
}
//接收反馈数据缓冲
void FPM10A_Receive_Data(uint8_t ucLength)
{
	uint8_t i;
	uint8_t ch;
//	for(i=0;i<ucLength;i++){
//		FPM10A_RECEICE_BUFFER[i] = my_finger_receive_char(); 
//		
//	}

    usart_receive_sync(&FPM10A_RECEICE_BUFFER,ucLength);
	

}

//FINGERPRINT_获得指纹图像命令
void FPM10A_Cmd_Get_Img(void)
{
    uint8_t i;
    FPM10A_Cmd_Send_Pack_Head(); //发送通信协议包头
    for(i=0;i<6;i++) //发送命令 0x1d
	{
       my_finger_send_char(FPM10A_Get_Img[i]);
	}
}
//讲图像转换成特征码存放在Buffer1中
void FINGERPRINT_Cmd_Img_To_Buffer1(void)
{
 	uint8_t i;
	FPM10A_Cmd_Send_Pack_Head(); //发送通信协议包头      
   	for(i=0;i<7;i++)   //发送命令 将图像转换成 特征码 存放在 CHAR_buffer1
     {
      my_finger_send_char(FPM10A_Img_To_Buffer1[i]);
   	  }
}
//将图像转换成特征码存放在Buffer2中
void FINGERPRINT_Cmd_Img_To_Buffer2(void)
{
     uint8_t i;
     for(i=0;i<6;i++)    //发送包头
	 {
    	my_finger_send_char(FPM10A_Pack_Head[i]);   
   	 }
     for(i=0;i<7;i++)   //发送命令 将图像转换成 特征码 存放在 CHAR_buffer1
      {
      	my_finger_send_char(FPM10A_Img_To_Buffer2[i]);
   	  }
}
//搜索全部用户999枚
void FPM10A_Cmd_Search_Finger(void)
{
	uint8_t i;	   	    
	FPM10A_Cmd_Send_Pack_Head(); //发送通信协议包头
	for(i=0;i<11;i++){
		my_finger_send_char(FPM10A_Search[i]);   
	}
}

void FPM10A_Cmd_Reg_Model(void)
{
	uint8_t i;	   
	FPM10A_Cmd_Send_Pack_Head(); //发送通信协议包头

	for(i=0;i<6;i++){
		my_finger_send_char(FPM10A_Reg_Model[i]);   
	}


}
//删除指纹模块里的所有指纹模版
void FINGERPRINT_Cmd_Delete_All_Model(void)
{
     uint8_t i;    
    for(i=0;i<6;i++) //包头
	{
		my_finger_send_char(FPM10A_Pack_Head[i]);  
	}
    for(i=0;i<6;i++) //命令合并指纹模版
	{
      my_finger_send_char(FPM10A_Delete_All_Model[i]);   
	}	
}
//保存指纹
void FPM10A_Cmd_Save_Finger( unsigned int storeID )
{
	unsigned long temp = 0;
	uint8_t i;
	FPM10A_Save_Finger[5] =(storeID&0xFF00)>>8;
	FPM10A_Save_Finger[6] = (storeID&0x00FF);
	for(i=0;i<7;i++)   //计算校验和
	{
		temp = temp + FPM10A_Save_Finger[i]; 
	}
	FPM10A_Save_Finger[7]=(temp & 0x00FF00) >> 8; //存放校验数据
	FPM10A_Save_Finger[8]= temp & 0x0000FF;		   
	FPM10A_Cmd_Send_Pack_Head(); //发送通信协议包头	
	for(i=0;i<9;i++)  
	{
		my_finger_send_char(FPM10A_Save_Finger[i]);      //发送命令 将图像转换成 特征码 存放在 CHAR_buffer1
	}
}
//添加指纹
void FPM10A_Add_Fingerprint()
{
	uint8_t id_show[]={0,0,0};
	uint8_t display_buf[10]={0};
	my_finger_clear_display(); //清空显示屏  
	while(1)
	{
		my_finger_show_str(0,1,"Input ID:");
		my_finger_show_str(0,2,"UP:+ DOWN:-");
		//按返回键直接回到主菜单
		if(my_finger_button_cancel_read()  == 0) 
		{
			while(my_finger_button_cancel_read() ==0);
			break;
		}
		//按上键finger值加一 
		if(my_finger_button_up_read() ==0)
		{
			while(my_finger_button_up_read() ==0);
			if(finger_id == 999)
			{
				finger_id = 0;
			}
			else
			{
				finger_id = finger_id + 1;
			};
		}
		//按上键finger值减一
		if(my_finger_button_down_read()  == 0)
		{
			while(my_finger_button_down_read() ==0);
			if(finger_id == 0)
			{
				finger_id = 999;
			}else{
				finger_id = finger_id - 1;
			}
		}
		memset(display_buf,0,10);
		sprintf(display_buf,"ID:%d",finger_id);
		my_finger_show_str(0,3,display_buf);
		//按确认键开始录入指纹信息 		 			
		if(my_finger_button_ok_read()  == 0)
		{	
			while(my_finger_button_ok_read() ==0);
			my_finger_clear_display(); //清空显示屏
			my_finger_show_str(0,1,"Input Finger");
			do
			{
				//按下返回键退出录入返回fingerID调整状态   
				if(my_finger_button_cancel_read()  == 0) 
				{
					while(my_finger_button_cancel_read() ==0);
				    break;
				}
				FPM10A_Cmd_Get_Img(); //获得指纹图像
				FPM10A_Receive_Data(12);
				//判断接收到的确认码,等于0指纹获取成功
				if(FPM10A_RECEICE_BUFFER[9]==0)
				{
				my_finger_delay_ms(100);
				FINGERPRINT_Cmd_Img_To_Buffer1();
				FPM10A_Receive_Data(12);
				my_finger_show_str(0,2,"Input Success");
				 
				my_finger_delay_ms(500);
				my_finger_show_str(0,3,"Confirm Finger");
				do
				{
					FPM10A_Cmd_Get_Img(); //获得指纹图像
					FPM10A_Receive_Data(12);
				    //判断接收到的确认码,等于0指纹获取成功
					if(FPM10A_RECEICE_BUFFER[9]==0)
					{
						my_finger_delay_ms(100);
						FINGERPRINT_Cmd_Img_To_Buffer2();
						FPM10A_Receive_Data(12);
						FPM10A_Cmd_Reg_Model();//转换成特征码
						FPM10A_Receive_Data(12); 
						FPM10A_Cmd_Save_Finger(finger_id++);                		         
						FPM10A_Receive_Data(12);
						my_finger_show_str(0,4,"Input Success");
						 
						my_finger_delay_ms(1000);
						break;
					}
				}while(my_finger_button_cancel_read()  == 1);
				break;
			}
		}while(my_finger_button_cancel_read()  == 1);
			my_finger_clear_display(); //清空显示屏
		}
			//	my_finger_delay_ms(500);
	}
}

//搜索指纹
void FPM10A_Find_Fingerprint()
{
	unsigned int find_fingerid = 0;
	uint8_t id_show[]={0,0,0};
	uint8_t display_buf[10]={0};
    my_finger_clear_display(); //清空显示屏
	my_finger_show_str(0,1,"Input Finger");
	while(my_finger_button_cancel_read()== 1)
	{
		FPM10A_Cmd_Get_Img(); //获得指纹图像
		FPM10A_Receive_Data(12);		
		//判断接收到的确认码,等于0指纹获取成功
		if(FPM10A_RECEICE_BUFFER[9]==0)
		{			
			my_finger_delay_ms(100);
			FINGERPRINT_Cmd_Img_To_Buffer1();
			FPM10A_Receive_Data(12);		
			FPM10A_Cmd_Search_Finger();
			FPM10A_Receive_Data(16);			
			if(FPM10A_RECEICE_BUFFER[9] == 0) //搜索到  
			{
				my_finger_clear_display();
				my_finger_show_str(0,1,"Input Finger");
				my_finger_show_str(0,2,"Search Success");
					 					
				//拼接指纹ID数
				find_fingerid = FPM10A_RECEICE_BUFFER[10]*256 + FPM10A_RECEICE_BUFFER[11];		
				memset(display_buf,0,10);
				sprintf(display_buf,"ID:%d",find_fingerid);
				my_finger_show_str(0,3,display_buf);
				my_finger_delay_ms(2000);
				break;				
			}
			else //没有找到
			{
				my_finger_clear_display();
				my_finger_show_str(0,1,"Input Finger");
				my_finger_show_str(0,2,"Can't find");
			}
			
//			if(my_finger_button_cancel_read()  == ){
//				
//			}
		}
	}
}
//删除所有存贮的指纹库
void FPM10A_Delete_All_Fingerprint()
{
		uint8_t i=0;
		my_finger_clear_display(); //清空显示屏
		my_finger_show_str(1,1,"Empty Finger?");
		do
		 {
			if(my_finger_button_ok_read() ==0)
			{
				while(my_finger_button_ok_read() ==0);
				my_finger_show_str(0,2,"Empting");
				my_finger_delay_ms(300);
				for(i=0;i<8;i++)
				{
					my_finger_show_str(i,3,"*");
					my_finger_delay_ms(200);
				}
				FINGERPRINT_Cmd_Delete_All_Model();
			    FPM10A_Receive_Data(12); 
				my_finger_show_str(2,4,"Empted");
				break;
			}
		 }while(my_finger_button_cancel_read() ==1);
}

void Device_Check(void)
{
	uint8_t i=0;
	FPM10A_RECEICE_BUFFER[9]=1;
	my_finger_clear_display(); //清空显示屏
	my_finger_show_str(1,1,"Device Loading");
	my_finger_delay_ms(500);
	for(i=0;i<8;i++)
	{
		my_finger_show_str(i,2,"*");
		my_finger_delay_ms(300);
	}
	my_finger_show_str(0,3,"Load failed");
	FPM10A_Cmd_Check();
	FPM10A_Receive_Data(12);
	
	while(FPM10A_RECEICE_BUFFER[9] == 0)
	{
		my_finger_show_str(0,3,"Load success");
		my_finger_delay_ms(1000);
		my_finger_clear_display();
		my_finger_show_str(2,1,"Welcome");
		my_finger_show_str(1,2,"Finger System");
		my_finger_delay_ms(1000);
		my_finger_show_str(1,3,"System Init");
		my_finger_delay_ms(500);
		for(i=0;i<8;i++)
		{
			my_finger_show_str(i,4,"*");
			my_finger_delay_ms(300);
		}
		my_finger_delay_ms(1000);
		break;
	}
	
}

void my_finger_init(void)
{
	my_finger_usart_init();//通信用的串口初始化
	my_finger_button_init();//按键初始化
	
}

void my_finger_display_main_menu(void)
{   
 	my_finger_clear_display();
    my_finger_show_str(0,1,"Finger System");
	my_finger_show_str(0,2,"1 Add Finger");
	my_finger_show_str(0,3,"2 Search Finger");
	my_finger_show_str(0,4,"3 Empty Finger"); 
	my_finger_show_str(120,local_date%4+2,"*"); //坐标位置
}





