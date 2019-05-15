#include "my_led.h"
#include "drv_gpio.h"


#ifndef NULL
#  define NULL ((void *)0)
#endif


/*LED接收结构体*/
led_receive_t led_receive={
	.pin_name=0,
	.status=0,
	.new_value=false
};



gpio_pin_handle_t pin_handle[4];


static int get_pin_index(pin_name_e pin_name)
{
	int pin_num;
	switch(pin_name)
	{
		case LED0:
		pin_num=0;
		break;
		case LED1:
		pin_num=1;
		break;
		case LED2:
		pin_num=2;
		break;
		case LED3:
		pin_num=3;
		break;
		default:
		pin_num=0;
		break;
	}
	return pin_num;
}

void led_init(pin_name_e pin_name)
{
	int pin_num=get_pin_index(pin_name);
	pin_handle[pin_num]=csi_gpio_pin_initialize(pin_name,NULL);
	csi_gpio_pin_config(pin_handle[pin_num],GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_write(pin_handle[pin_num],LED_OFF);
}

void led_switch(pin_name_e pin_name,int status)
{
	int pin_num=get_pin_index(pin_name);
	if(status==LED_ON)
	{
		csi_gpio_pin_write(pin_handle[pin_num],LED_ON);
	}else{
		csi_gpio_pin_write(pin_handle[pin_num],LED_OFF);
	}
}