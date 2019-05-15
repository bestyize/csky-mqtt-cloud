#ifndef _DELAY_H
#define _DELAY_H
#include "stdint.h"


void udelay(uint32_t us);
void mdelay(uint32_t ms);

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:us级延时程序
 * us           :us
 * */
void delay_us(uint32_t us);

/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:ms级延时程序
 * us           :ms
 * */
void delay_ms(uint32_t ms);



#endif