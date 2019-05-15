#include "command.h"
#include "esp8266.h"
#include "my_led.h"
#include "my_pwm.h"
#include "string.h"
#include "stdbool.h"
#include "stdint.h"
#include "assert.h"
#include "stdlib.h"


/*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:解析出ESP接收任务相关数据，比如PWM的占空比，相关约定的数据放在了command.h里面
 * buf          :接收到的命令
 * */
static int get_cmd_params(uint8_t buf[])
{
	char value[4]={0};
//	int len=strlen((char*)buf);
	int i=4;
	for(i=4;i<8;i++)
	{
		value[i-4]=buf[i];
	}
	
	return atoi((char*)value)-1000;
}


/*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:解析ESP8266传过来的命令，并且给相关结构体赋值
 * */
void esp_cmd_parse()
{
	if(strstr((char*)esp_usart_receive.buf,CMD_RECEIVE_PWM_ADJ)!=NULL)
	{
		//todo
		pwm_receive.duty=get_cmd_params(esp_usart_receive.buf);
		pwm_receive.pin_name=DEFAULT_PWM_PIN;
		pwm_receive.new_value=true;
		
	}
	if(strstr((char*)esp_usart_receive.buf,CMD_RECEIVE_LED_ON)!=NULL)
	{
		//todo
		led_receive.pin_name=0;
		led_receive.status=true;
		led_receive.new_value=true;
		
	}
	if(strstr((char*)esp_usart_receive.buf,CMD_RECEIVE_LED_OFF)!=NULL)
	{
		//todo
		led_receive.pin_name=0;
		led_receive.status=false;
		led_receive.new_value=true;
	}
	if(strstr((char*)esp_usart_receive.buf,CMD_RECEIVE_DHT11_READ)!=NULL)
	{
		//todo
		
		
	}
	if(strstr((char*)esp_usart_receive.buf,CMD_RECEIVE_DHT11_OFF)!=NULL)
	{
		//todo
		
	}
	if(strstr((char*)esp_usart_receive.buf,CMD_VOLTAGE_READ)!=NULL)
	{
		//todo
		
	}
	if(strstr((char*)esp_usart_receive.buf,CMD_VOLTAGE_OFF)!=NULL)
	{
		//todo
		
	}

}


