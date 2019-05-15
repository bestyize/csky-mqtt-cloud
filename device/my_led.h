#ifndef _MY_LED_H
#define _MY_LED_H
#include "pin.h"
#include "stdbool.h"





#define LED0 PA12
#define LED1 PA13
#define LED2 PA14
#define LED3 PA15

#define LED_ON 0x0
#define LED_OFF 0x1


/*串口接收结构体*/
typedef struct{
	pin_name_e pin_name;
	bool status;
	bool new_value;
}led_receive_t;

extern led_receive_t led_receive;


void led_init(pin_name_e pin_name);
void led_switch(pin_name_e pin_name,int status);



#endif