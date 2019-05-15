#ifndef _MY_PWM_H
#define _MY_PWM_H
#include "pin.h"
#include "stdbool.h"


#define DEFAULT_PWM_PIN PA13

/*串口接收结构体*/
typedef struct{
	pin_name_e pin_name;
	int duty;
	bool new_value;
}pwm_receive_t;

extern pwm_receive_t pwm_receive;


/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:PWM初始化
 * pin_name     :引脚的名字，在pin_name.h里定义
 * 支持的引脚有：PA4,PA5,PA6,PA7,PA12,PA13,PA14,PA15,PA22,PA23,PB0,PB2,PB3,PC0,PC1
 * */
void my_pwm_init(pin_name_e pin_name);

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:PA13 pwm9初始化以及周期输出
 * */
void my_pwm_test(void);

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:pwm输出
 * pin_name     :引脚名
 * freq         :pwm频率 单位Hz
 * duty         :占空比  单位0-100
 * */
void my_pwm_out(pin_name_e pin_name,uint32_t freq,uint32_t duty);

#endif