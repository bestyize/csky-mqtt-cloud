#include "delay.h"
#include <csi_kernel.h>



/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:us级延时程序
 * us           :us
 * */
void delay_us(uint32_t us)
{
	udelay(us);
}
/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:ms级延时程序
 * us           :ms
 * */
void delay_ms(uint32_t ms)
{
	csi_kernel_delay_ms(ms);
}