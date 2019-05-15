#include "my_vol.h"
#include "drv_adc.h"
#include "ck_adc.h"
#include "pin_name.h"
#include "pinmux.h"
#include "string.h"
#include "stdio.h"

#ifndef NULL
#  define NULL ((void *)0)
#endif

#define MY_VOL_ADC_PIN PA16  /*ADC8*/
#define MY_VOL_ADC_INDEX 8

#define MY_VOL_ADC_FUNC PA16_ADC_A8

static adc_handle_t vol_handle;


static float get_adc_values()
{
	int num=5;
	uint32_t data;
	drv_adc_start(vol_handle);
	drv_adc_read(vol_handle,&data,num);
	adc_status_t status=drv_adc_get_status(vol_handle);
	while(status.complete==1);//等待转换完成
	drv_adc_stop(vol_handle);
	return 3.3*data/4096;
}

void my_vol_init()
{
	//Init adc ...
	adc_handle_t handle;
	drv_pinmux_config(MY_VOL_ADC_PIN,MY_VOL_ADC_FUNC);
	handle=drv_adc_initialize(MY_VOL_ADC_INDEX,NULL);
	vol_handle=handle;
	adc_conf_t adc_conf = {
		.clk_prescaler = 4,
		.mode = ADC_SINGLE,
		.trigger=0,
		.intrp_mode=0,
		.channel_array= (uint32_t*)CK_ADC_CH8,
		.channel_nbr= 1,
		.conv_cnt=1,
		.sampling_time=1,
		.offset=0
	};
	drv_adc_config(vol_handle,&adc_conf);
	drv_adc_start(vol_handle);
}


//返回的格式应该是 "vol:status:voltage 2.66v"其中"vol:status:"分是固定的
void get_vol_value(char buf[])
{
	//Todo acquire 
	float vol=get_adc_values();
	//memset(buf,0,sizeof(buf));//这里报警告，考虑到本次返回的字符串长度在22个
	memset(buf,0,22);
	sprintf(buf,"vol:status:vol %.2fv",vol);
}