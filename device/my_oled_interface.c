/*
 * Author 		:yize
 * Date   		:2019-5-15
 * Function		:OLED所用引脚在这里实现,假如需要移植，则仅仅修改本文件即可
 * */
#include "my_oled_interface.h"
#include "drv_gpio.h"
#include "pin.h"
#include "pin_name.h"
#include "stdbool.h"

#ifndef NULL
#  define NULL ((void *)0)
#endif

#define MY_OLED_SCL_PIN PA4 //SCL引脚
#define MY_OLED_SDA_PIN PA5 //SDA引脚
#define MY_OLED_RES_PIN PA24 //RES引脚（RST）
#define MY_OLED_DC_PIN  PA25//DC引脚

/*
 * Author 		:yize
 * Date   		:2019-5-15
 * Function		:各个相关引脚的句柄
 * */

static gpio_pin_handle_t scl_handle;
static gpio_pin_handle_t sda_handle;
static gpio_pin_handle_t res_handle;
static gpio_pin_handle_t dc_handle;

/*
 * Author 		:yize
 * Date   		:2019-5-15
 * Function		:oled初始化
 * */

void oled_pin_init()
{
	gpio_pin_handle_t my_sda_handle;
	gpio_pin_handle_t my_scl_handle;
	gpio_pin_handle_t my_res_handle;
	gpio_pin_handle_t my_dc_handle;
	
	my_scl_handle=csi_gpio_pin_initialize(MY_OLED_SCL_PIN,NULL);
	my_sda_handle=csi_gpio_pin_initialize(MY_OLED_SDA_PIN,NULL);
	my_res_handle=csi_gpio_pin_initialize(MY_OLED_RES_PIN,NULL);
	my_dc_handle=csi_gpio_pin_initialize(MY_OLED_DC_PIN,NULL);
	scl_handle=my_scl_handle;
	sda_handle=my_sda_handle;
	res_handle=my_res_handle;
	dc_handle=my_dc_handle;
	csi_gpio_pin_config(scl_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_config(sda_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_config(res_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_config(dc_handle,GPIO_MODE_PUSH_PULL,GPIO_DIRECTION_OUTPUT);
	csi_gpio_pin_write(scl_handle,1);
	csi_gpio_pin_write(sda_handle,1);
	csi_gpio_pin_write(res_handle,1);
	csi_gpio_pin_write(dc_handle,1);
}
/*
 * Author 		:yize
 * Date   		:2019-5-15
 * Function		:scl输出高电平
 * */

void oled_scl_out_high()
{
	csi_gpio_pin_write(scl_handle,1);
}
/*
 * Author 		:yize
 * Date   		:2019-5-15
 * Function		:scl输出低电平
 * */
void oled_scl_out_low()
{
	csi_gpio_pin_write(scl_handle,0);
}
/*
 * Author 		:yize
 * Date   		:2019-5-15
 * Function		:sda输出高电平
 * */
void oled_sda_out_high()
{
	csi_gpio_pin_write(sda_handle,1);
}
void oled_sda_out_low()
{
	csi_gpio_pin_write(sda_handle,0);
}
void oled_res_out_high()
{
	csi_gpio_pin_write(res_handle,1);
}
void oled_res_out_low()
{
	csi_gpio_pin_write(res_handle,0);
}
void oled_dc_out_high()
{
	csi_gpio_pin_write(dc_handle,1);
}
void oled_dc_out_low()
{
	csi_gpio_pin_write(dc_handle,0);
}





