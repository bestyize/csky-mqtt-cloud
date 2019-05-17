#include "service.h"
#include <csi_kernel.h>


/*硬件*/
#include "my_pwm.h"
#include "my_led.h"
#include "my_oled.h"
#include "my_dht11.h"
#include "my_vol.h"
#include "delay.h"
#include "esp8266.h"
#include "command.h"
#include "string.h"
#include "stdio.h"

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:ESP接收任务相关参数
 * */
#define ESP_RECEIVE_TASK_PRIO   5
#define ESP_RECEIVE_TASK_STK_SIZE 512
k_task_handle_t esp_receive_task_handle;
static void esp_receive_task(void);

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:PWM任务相关参数
 * */
#define PWM_TASK_PRIO    6
#define PWM_TASK_STK_SIZE 512
k_task_handle_t pwm_task_handle;
static void pwm_task(void);

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:LED任务相关参数
 * */
#define LED_TASK_PRIO   7
#define LED_TASK_STK_SIZE 512
k_task_handle_t led_task_handle;
static void led_task(void);


/*
 * Author 		:yize
 * Date   		:2019-5-11
 * Function		:ESP电压任务相关参数
 * */
#define DHT11_TASK_PRIO   8
#define DHT11_TASK_STK_SIZE 512
k_task_handle_t dht11_task_handle;
static void dht11_task(void);


/*
 * Author 		:yize
 * Date   		:2019-5-11
 * Function		:OLED显示任务，每隔500ms刷新一次
 * */
#define DISPLAY_TASK_PRIO   9
#define DISPLAY_TASK_STK_SIZE 512
k_task_handle_t display_task_handle;
static void display_task(void);




static char* get_message(char* cmd,char *dst)
{
	int i = strlen(dst)-1;
	char* temp = (char*)(cmd + i);
	return temp;
}


/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:服务初始化
 * */
void services_init(void)
{
	csi_kernel_init();
    csi_kernel_task_new((k_task_entry_t)pwm_task, "pwm_task",0, PWM_TASK_PRIO, 0, 0, PWM_TASK_STK_SIZE, &pwm_task_handle);
	csi_kernel_task_new((k_task_entry_t)led_task, "led_task",0, LED_TASK_PRIO, 0, 0, LED_TASK_STK_SIZE, &led_task_handle);
    csi_kernel_task_new((k_task_entry_t)esp_receive_task, "esp_receive_task",0, ESP_RECEIVE_TASK_PRIO, 0, 0, ESP_RECEIVE_TASK_STK_SIZE, &esp_receive_task_handle);
	csi_kernel_task_new((k_task_entry_t)dht11_task, "dht11_task",0, DHT11_TASK_PRIO, 0, 0, DHT11_TASK_STK_SIZE, &dht11_task_handle);
	csi_kernel_task_new((k_task_entry_t)display_task, "display_task",0, DISPLAY_TASK_PRIO, 0, 0, DISPLAY_TASK_STK_SIZE, &display_task_handle);
	csi_kernel_start();
}

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:PWM服务实体，负责接收云端的PWM输出
 * */
static void pwm_task(void)
{
	char buf[20]={0};
	while(1)
	{
		if(pwm_receive.new_value==true)
		{
			my_pwm_out(PA13,10000,pwm_receive.duty);
			pwm_receive.new_value=false;
			memset(buf,0,sizeof(buf));
			sprintf(buf,"duty:%d",pwm_receive.duty);
			esp_usart_send_str(buf);
			memset(oled_display.oled_display_params[2].buf,0,OLED_BUF_LEN);
			strcpy(oled_display.oled_display_params[2].buf,buf);
			oled_display.oled_display_params[2].new_value=true;
		}
		delay_ms(200);		
	}	
}

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:led服务实体，受到云端控制
 * */
 
static void led_task(void)
{
	char buf[40]={0};
	sprintf(buf,"led:status:led now is off");
	memset(oled_display.oled_display_params[1].buf,0,OLED_BUF_LEN);
	strcpy(oled_display.oled_display_params[1].buf,"led:off");
	oled_display.oled_display_params[1].new_value=true;
	while(1)
	{
		if(led_receive.new_value==true)
		{
			led_switch(LED3,led_receive.status);
			memset(buf,0,40);
			memset(oled_display.oled_display_params[1].buf,0,OLED_BUF_LEN);
			if(led_receive.status==true)
			{
				sprintf(buf,"led:status:led now is off");
				strcpy(oled_display.oled_display_params[1].buf,"led:off");
			}else{
				sprintf(buf,"led:status:led now is  on");
				strcpy(oled_display.oled_display_params[1].buf,"led: on");
			}
			esp_usart_send_str(buf);
			led_receive.new_value=false;
			oled_display.oled_display_params[1].new_value=true;
		}
		delay_ms(100);
	}
}

/*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:esp8266数据接收任务，用来解析命令
 * */
static void esp_receive_task(void)
{
	while(1)
	{
		esp_wait_reply();
		delay_ms(100);
	}
}


/*
 * Author 		:yize
 * Date   		:2019-5-13
 * Function		:温湿度计任务
 * */
static void dht11_task(void)
{
	char temp[40] = {0};
	while(1)
	{
		get_temp_humi(temp);
		esp_usart_send_str(temp);
//		my_oled_show_str(0,32,"temp");
		memset(oled_display.oled_display_params[0].buf,0,OLED_BUF_LEN);
		char *message=get_message(temp,"dht:status:t");
		strcpy(oled_display.oled_display_params[0].buf,message);
		oled_display.oled_display_params[0].new_value=true;
		delay_ms(2000);	
	}
}


void display_task(void)
{
	while(1)
	{
		int i=0,line;
		for(i=0;i<8;i++)
		{
			if(oled_display.oled_display_params[i].new_value==true)
			{
				line=oled_display.oled_display_params[i].line;
				my_oled_show_str(line,i,(uint8_t*)oled_display.oled_display_params[i].buf);
				memset(oled_display.oled_display_params[i].buf,0,OLED_BUF_LEN);
				oled_display.oled_display_params[i].new_value=false;
			}
		}	
		delay_ms(500);	
	}
}