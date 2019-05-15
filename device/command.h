

#ifndef _COMMAND_H
#define _COMMAND_H

/*自定义的通信格式，串口通信*/
#define CMD_RECEIVE_LED_ON      	"led:1001"//显示 
#define CMD_RECEIVE_LED_OFF     	"led:1002"//取消显示
#define CMD_RECEIVE_LED_STATUS  	"led:status:"


#define CMD_RECEIVE_DHT11_READ  	"dht:1003"
#define CMD_RECEIVE_DHT11_OFF   	"dht:1004"
#define CMD_RECEIVE_DHT11_STATUS  	"dht:status:"//回复温湿度


#define CMD_VOLTAGE_READ        	"vol:1005"
#define CMD_VOLTAGE_OFF         	"vol:1006"
#define CMD_RECEIVE_VOLTAGE_STATUS  "vol:status:"//回复电压


#define CMD_RECEIVE_PWM_ADJ     "pwm:"//data是PWM的占空比，1000-1100,最终值减去1000
#define CMD_RECEIVE_PWM_STATUS  "duty:"//PWM回复自身状态



void esp_cmd_parse();


#endif