#include "bmp280_interface.h"
#include "drv_gpio.h"

#include "stdbool.h"
#include "stdint.h"
#include "pin_name.h"
#include "pin.h"


#include "delay.h"

#ifndef NULL
#  define NULL ((void *)0)
#endif

#define BMP_SCL_PIN PA16  /*SCL*/
#define BMP_SDA_PIN PA17  /*SDA*/

static gpio_pin_handle_t bmp_scl_pin_handle;
static gpio_pin_handle_t bmp_sda_pin_handle;

/*
 * Author 		:yize
 * Date   		:2019-5-20
 * Function		:bmp280两个引脚初始化
 * */
void bmp280_pin_init(void)
{
	bmp_scl_pin_handle=csi_gpio_pin_initialize(BMP_SCL_PIN,NULL);
	bmp_sda_pin_handle=csi_gpio_pin_initialize(BMP_SDA_PIN,NULL);
	csi_gpio_pin_config(bmp_scl_pin_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_write(bmp_scl_pin_handle,true);
	csi_gpio_pin_config(bmp_sda_pin_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_write(bmp_sda_pin_handle,true);
}

/*
 * Author 		:yize
 * Date   		:2019-5-20
 * Function		:bmp280相关引脚操作
 * */
void bmp_scl_pin_out(bool status)
{
	csi_gpio_pin_write(bmp_scl_pin_handle,status);
}
/*
 * Author 		:yize
 * Date   		:2019-5-20
 * Function		:bmp280相关引脚操作
 * */
void bmp_sda_pin_out(bool status)
{
	csi_gpio_pin_config(bmp_sda_pin_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_write(bmp_sda_pin_handle,status);
	
}
/*
 * Author 		:yize
 * Date   		:2019-5-20
 * Function		:bmp280相关引脚操作
 * */
uint8_t bmp_sda_pin_read(void)
{
	bool values;
	csi_gpio_pin_config(bmp_sda_pin_handle,GPIO_MODE_PULLUP,GPIO_DIRECTION_INPUT);
	csi_gpio_pin_read(bmp_sda_pin_handle,&values);
	return values;
}
/*
 * Author 		:yize
 * Date   		:2019-5-20
 * Function		:bmp280相关引脚操作
 * */
void bmp_delay_ms(uint32_t ms)
{
	delay_ms(ms);
}
/*
 * Author 		:yize
 * Date   		:2019-5-20
 * Function		:bmp280相关引脚操作
 * */
void bmp_delay_us(uint32_t us)
{
	delay_us(us);
}




