#include "my_pwm.h"
#include "drv_pwm.h"
#include "pin.h"
#include <stdint.h>
#include <stdio.h>
#include "assert.h"
#include "delay.h"
#include "stdbool.h"

#define PWM_TOTAL_COUNT 15
/*PWM句柄*/
pwm_handle_t pwm_handle[PWM_TOTAL_COUNT];
/*PWM周期，高电平持续时间 单位都是us*/
uint32_t pwm_period_us,pwm_high_us;
/*通道*/
uint8_t channel;

/*pwm接收结构体*/
pwm_receive_t pwm_receive={
		.pin_name=DEFAULT_PWM_PIN,
		.duty=0,
		.new_value=false
};

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:PWM初始化
 * pin_name     :引脚的名字，在pin_name.h里定义
 * 支持的引脚有：PA4,PA5,PA6,PA7,PA12,PA13,PA14,PA15,PA22,PA23,PB0,PB2,PB3,PC0,PC1
 * */
void my_pwm_init(pin_name_e pin_name)
{
	int ret;
	int handle_id;
	pin_func_e pin_func;
	switch(pin_name)
	{
		case PA4:
		pin_func=PA4_PWM_CH0;
		channel=0;
		handle_id=0;
		break;
		case PA5:
		pin_func=PA5_PWM_CH1;
		channel=1;
		handle_id=1;
		break;
		case PB0:
		pin_func=PB0_PWM_CH2;
		channel=2;
		handle_id=2;
		break;
		case PB2:
		pin_func=PB2_PWM_CH4;
		channel=4;
		handle_id=3;
		break;
		case PB3:
		pin_func=PB3_PWM_CH5;
		channel=5;
		handle_id=4;
		break;
		case PA6:
		pin_func=PA6_PWM_CH6;
		channel=6;
		handle_id=5;
		break;
		case PA7:
		pin_func=PA7_PWM_CH7;
		channel=7;
		handle_id=6;
		break;
		case PA12:
		pin_func=PA12_PWM_CH8;
		channel=8;
		handle_id=7;
		break;
		case PA13:
		pin_func=PA13_PWM_CH9;
		channel=9;
		handle_id=8;
		break;
		case PA14:
		pin_func=PA14_PWM_CH10;
		channel=10;
		handle_id=9;
		break;
		case PA15:
		pin_func=PA15_PWM_CH11;
		channel=11;
		handle_id=10;
		break;
		case PA22:
		pin_func=PA22_PWM_CH0;
		channel=0;
		handle_id=11;
		break;
		case PA23:
		pin_func=PA23_PWM_CH1;
		channel=1;
		handle_id=12;
		break;
		case PC0:
		pin_func=PC0_PWM_CH10;
		channel=10;
		handle_id=13;	
		break;
		case PC1:
		pin_func=PC1_PWM_CH11;
		channel=11;
		handle_id=14;
		break;
		default:
		pin_func=PA13_PWM_CH9;
		channel=9;
		handle_id=8;
		break;
	}
	ret=drv_pinmux_config(pin_name,pin_func);
	if(ret!=0)
	{
		printf("Error");
		return;
	}
	pwm_handle[handle_id]=csi_pwm_initialize(0);
	if(pwm_handle[handle_id]==NULL)
	{
		printf("Init Failed!\n");
		return;
	}
	my_pwm_out(pin_name,10000,50);
	csi_pwm_start(pwm_handle[handle_id],channel);
}

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:pwm测试 PA13 也就是PWM9 输出一个占空比50％的方波       
 * */
void my_pwm_test(void)
{
	int i=0,dir=0,ret=0;
	ret=drv_pinmux_config(PA13,PA13_PWM_CH9);
	if(ret!=0)
	{
		printf("Error");
	}
	pwm_handle[8]=csi_pwm_initialize(0);
	if(pwm_handle==NULL)
	{
		printf("Init Failed!\n");
	}
	csi_pwm_config(pwm_handle[8],9,200,1);
	csi_pwm_start(pwm_handle[8],9);

    while (1) {
		
		if(i>200)
		{
			dir=1;
		}else if(i<0){
			dir=0;
		}
		if(dir==0)
		{
			i++;
		}else{
			i--;
		}
		csi_pwm_config(pwm_handle[8],9,200,i);
        delay_ms(10);
    }
}

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:pwm输出
 * freq         :pwm频率 单位Hz
 * duty         :占空比  单位0-100
 * */
void my_pwm_out(pin_name_e pin_name,uint32_t freq,uint32_t duty)
{
	int handle_id;
	switch(pin_name)
	{
		case PA4:
		handle_id=0;
		break;
		case PA5:
		handle_id=1;
		break;
		case PB0:
		handle_id=2;
		break;
		case PB2:
		handle_id=3;
		break;
		case PB3:
		handle_id=4;
		break;
		case PA6:
		handle_id=5;
		break;
		case PA7:
		handle_id=6;
		break;
		case PA12:
		handle_id=7;
		break;
		case PA13:
		handle_id=8;
		break;
		case PA14:
		handle_id=9;
		break;
		case PA15:
		handle_id=10;
		break;
		case PA22:
		handle_id=11;
		break;
		case PA23:
		handle_id=12;
		break;
		case PC0:
		handle_id=13;	
		break;
		case PC1:
		handle_id=14;
		break;
		default:
		handle_id=8;
		break;
	}
	assert(duty>=0&&duty<=100);
	assert(handle_id!=NULL);
	pwm_period_us=1000000/freq;
	pwm_high_us=pwm_period_us*duty/100;
	csi_pwm_config(pwm_handle[handle_id],channel,pwm_period_us,pwm_high_us);
}

