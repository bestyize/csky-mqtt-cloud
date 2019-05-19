/**
 * 
 * Author 		:yize
 * Date   		:2019-5-19
 * Function		:中天微课设
 * 
 * 引脚说明：OLED12864引脚       SCL:PA4 SDA:PA5
 * 			 DHT11引脚   		 OUT:PA8
 *           ESP8266             RX:PA10 TX:PA11
 * 			 PWM                 PA13
 * 			 LED                 PA15
 * */

#include <stdint.h>
#include <stdio.h>

#include "my_device.h"
#include "service.h"
#include "my_usart.h"
#include "delay.h"
#include "my_oled.h"


void init()
{
	device_init();
	services_init();
}

int main(void)
{
	init();
	while(1);
}



