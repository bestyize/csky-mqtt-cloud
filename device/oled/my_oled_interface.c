#include "my_oled_interface.h"
#include "stdbool.h"
#include "delay.h"

#include "drv_gpio.h"
#include "pin.h"
#include "pin_name.h"

#ifndef NULL
#  define NULL ((void *)0)
#endif



#define OLED_PIN_SCL PA4
#define OLED_PIN_SDA PA5

static gpio_pin_handle_t scl_handle;
static gpio_pin_handle_t sda_handle;



void my_oled_delay_ms(int ms)
{
	mdelay(ms);
}


void my_oled_pin_init(void)
{
	scl_handle=csi_gpio_pin_initialize(OLED_PIN_SCL,NULL);
	sda_handle=csi_gpio_pin_initialize(OLED_PIN_SDA,NULL);
	
	csi_gpio_pin_config(scl_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_config(sda_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	
	csi_gpio_pin_write(scl_handle,true);
	csi_gpio_pin_write(sda_handle,true);
	
}

void my_oled_scl_out(bool status)
{
	csi_gpio_pin_write(scl_handle,status);
}

void my_oled_sda_out(bool status)
{
	csi_gpio_pin_write(sda_handle,status);
}