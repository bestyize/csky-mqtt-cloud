#include <stdio.h>
#include "my_finger.h"
#include "delay.h"
#include "oled.h"

void hardware_init()
{
	OLED_Init();
	my_finger_init();
}


void control()
{
	Device_Check();
	my_finger_delay_ms(500); //延时500MS，等待指纹模块复位
    my_finger_display_main_menu();
	while(1)
	{
		if(local_date!=base_date) //光标位置变化，则更新显示 
		{
			my_finger_display_main_menu();
			base_date=local_date;
		}
		if(my_finger_button_ok_read() == 0)
		{	 
			while(my_finger_button_ok_read() == 0);//等待松开按键								
			switch(local_date)
			{
				case 0:	 //添加指纹
					FPM10A_Add_Fingerprint();
					local_date = 0;
					my_finger_display_main_menu();	
				break; 	
				case 1://搜索指纹						
					FPM10A_Find_Fingerprint();							
					local_date = 1;
					my_finger_display_main_menu();																	
					break;									
					case 2:	//清空指纹
					FPM10A_Delete_All_Fingerprint();
					local_date = 2;									
					my_finger_display_main_menu();
		  		break;
			}
		}
		//下
		if(my_finger_button_down_read() == 0)
		{
			while(my_finger_button_down_read() == 0); //等待松开按键				
			if(local_date<=2)
			{
				local_date++;
				if(local_date==3)
				{
					local_date=0;
				}
			}				
		}			
		//上
		if(my_finger_button_up_read() == 0)
		{ 
			while(my_finger_button_up_read() == 0); //等待松开按键
			if(local_date>=0)
			{
				local_date--;
				if(local_date==-1)
				{
					local_date=2;
				}		
			}					
		}			
		my_finger_delay_ms(100); //延时判断100MS检测一次		
	}
}



int main_test(void)
{
    hardware_init();
    control();

    return 0;
}