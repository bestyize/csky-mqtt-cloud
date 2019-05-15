#include "my_usart.h"
#include "drv_usart.h"
#include "pin.h"
#include "assert.h"
/*
 * 如果用到了就实现
 * 
 * */
 
#ifndef NULL
#  define NULL ((void *)0)
#endif
 
 
#define MY_USART_RX_PIN PA16
#define MY_USART_TX_PIN PA17
#define MY_USART_RX_FUNC PA16_UART1_RX
#define MY_USART_TX_FUNC PA17_UART1_TX

#define MY_USART_INDEX 1



/*串口1的句柄*/
static usart_handle_t my_usart_handler;



static void usart_event_cb(int32_t idx, uint32_t event)
{
    switch (event) {
        case USART_EVENT_SEND_COMPLETE:
            
            break;

        case USART_EVENT_RECEIVE_COMPLETE:
            my_usart_send_str("receive\r\n");
            break;

        default:
            break;
    }
}

 
/*
 * Author 		:yize
 * Date   		:2019-5-9
 * Function		:串口1初始化函数
 * baud_rate    :波特率
 * */
void my_usart_init(uint32_t baud_rate)
{
	usart_handle_t handler;
	 /*复用*/
	assert(drv_pinmux_config(MY_USART_RX_PIN,MY_USART_RX_FUNC)==0);
	assert(drv_pinmux_config(MY_USART_TX_PIN,PA17_UART1_TX)==0);
	handler=csi_usart_initialize(MY_USART_INDEX,usart_event_cb);
	my_usart_handler=handler;
	assert(csi_usart_config(handler,baud_rate,USART_MODE_ASYNCHRONOUS,USART_PARITY_NONE,USART_STOP_BITS_1,USART_DATA_BITS_8)==0);
	my_usart_send_str("my usart init successful\r\n");
		
}


/*
 * Author 		:yize
 * Date   		:2019-5-9
 * Function		:字符串发送函数 这里用了csi_usart_putchar()这个函数，在底层的printf()函数内部就是被它替换了
 * baud_rate    :波特率 推荐 115200
 * */
void my_usart_send_str(const char *params)
{
	if(params==NULL)
	{
		return;
	}
	if(my_usart_handler==NULL)
	{
		return;
	}
	
	while(*params)
	{
		csi_usart_putchar(my_usart_handler,*params++);
	}
}






