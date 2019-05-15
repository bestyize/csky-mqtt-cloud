#include "esp8266.h"
#include "service.h"
#include "my_usart.h"
#include "my_led.h"
#include "pin.h"
#include "string.h"
#include "drv_usart.h"
#include "stdint.h"
#include "command.h"

#ifndef NULL
#  define NULL ((void *)0)
#endif



/*串口接收结构体*/
usart_receive esp_usart_receive={
	.buf={0},
	.count=0,
	.finish=false
};


/*ESP8266所用串口句柄*/
static usart_handle_t esp_usart_handler;


/*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:串口接收
 * usart        :串口句柄
 * data         :等待接受的数据指针，接收完后就放在data里面了
 * num          :等待接收到的数据量
 * */
void esp_usart_receive_init()
{
	memset(esp_usart_receive.buf,0,10);
	esp_usart_receive.count=0;
	esp_usart_receive.finish=false;
}



/*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:同步接收消息函数（除了超时外，接受不完不退出）
 * usart        :串口句柄
 * data         :等待接受的数据指针，接收完后就放在data里面了
 * num          :等待接收到的数据量
 * */
static int32_t usart_receive_sync(usart_handle_t usart, void *data, uint32_t num)
{
    int time_out = 0x7ffff;
    usart_status_t status;

    csi_usart_receive(usart, data, num);

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(usart);

        if (!status.rx_busy) {
            break;
        }
    }

    if (0 == time_out) {
        return -1;
    }

    return 0;
}

/*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:同步发送消息函数（除了超时外，不发完不退出）
 * usart        :串口句柄
 * data         :等待发送的数据
 * num          :等待发送的数据量
 * */
//static int32_t usart_send_sync(usart_handle_t usart, const void *data, uint32_t num)
//{
//    int time_out = 0x7ffff;
//    usart_status_t status;
//
//    csi_usart_send(usart, data, num);
//
//    while (time_out) {
//        time_out--;
//        status = csi_usart_get_status(usart);
//
//        if (!status.tx_busy) {
//            break;
//        }
//    }
//
//    if (0 == time_out) {
//        return -1;
//    }
//
//    return 0;
//}

//static void esp_usart_send_reply(const char buf[])
//{
//	int i,len=strlen(buf);
//	if(len==0)
//	{
//		return;
//	}
//	if(esp_usart_handler==NULL)
//	{
//		return;
//	}
//	
//	for(i=0;i<len;i++)
//	{
//		if(buf[i]!=0x08)
//		{
//			csi_usart_putchar(esp_usart_handler,buf[i]);
//		}
//		
//	}
//	csi_usart_putchar(esp_usart_handler,'\r');
//	csi_usart_putchar(esp_usart_handler,'\n');
//}

static void esp_on_receive_str()
{
//	esp_usart_send_reply((char*)esp_usart_receive.buf);
	esp_cmd_parse();
	
}


/*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:这里是等待ESP8266发过来消息，因为中断难以实现，故只能采用这种方式了，我将其放在一个任务里面实现了
 * */
void esp_wait_reply()
{
	uint8_t ch[10]={0};
	int i=0;
	esp_usart_receive_init();
	while(esp_usart_receive.finish==false)
	{
		int ret=usart_receive_sync(esp_usart_handler,&ch,8);
		if(ret==0)
		{
			for(i=0;i<strlen((char*)ch);i++)
			{
				esp_usart_receive.buf[esp_usart_receive.count++]=ch[i];
			}
			esp_on_receive_str();
			break;
		}
	}
}


/*
 * Author 		:yize
 * Date   		:2019-5-4
 * Function		:CK802对接ESP8266串口的初始化函数
 * uart_idx     :串口的索引号，CK802有三个串口，索引号分别是0、1、2
 * note         :其实这里初始化并不是完整的初始化，这里面缺少引脚复用，主要是因为官方的例程中在boart_init.c里面已经初始化了一下
 *              如果想要使用别的串口的话，要把下面注释的两行代码实现
 * */
void esp_usart_init(int32_t uart_idx)
{
    usart_handle_t p_csi_usart;
    int32_t ret;
	
//	drv_pinmux_config(CONSOLE_TXD, CONSOLE_TXD_FUNC);
//  drv_pinmux_config(CONSOLE_RXD, CONSOLE_RXD_FUNC);
	 /* init the USART*/
    p_csi_usart = csi_usart_initialize(uart_idx, NULL);
	esp_usart_handler=p_csi_usart;

    if (p_csi_usart == NULL) {
        esp_usart_send_str("esp8266 usart init error\r\n");
        return;
    }

    /* config the USART */
    ret = csi_usart_config(p_csi_usart, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);

    if (ret < 0) {
        esp_usart_send_str("esp8266 usart config error\r\n");
        return;
    }
	esp_usart_send_str("esp8266 usart init successful !\r\n");
	esp_usart_receive_init();
}


/*
 * Author 		:yize
 * Date   		:2019-5-3
 * Function		:字符串发送函数 这里用了csi_usart_putchar()这个函数，在底层的printf()函数内部就是被它替换了
 * baud_rate    :波特率 推荐 115200
 * */
void esp_usart_send_str(const char buf[])
{
	int i,len=strlen(buf);
	if(len==0)
	{
		return;
	}
	if(esp_usart_handler==NULL)
	{
		return;
	}
	
	for(i=0;i<len;i++)
	{
		if((buf[i]>='a'&&buf[i]<='z')||(buf[i]>='0'&&buf[i]<='9')||(buf[i]==' ')||(buf[i]==':')||(buf[i]>='A'&&buf[i]<='Z'))
		{
			csi_usart_putchar(esp_usart_handler,buf[i]);
		}
		
	}
//	
//	while(len)
//	{
//		csi_usart_putchar(esp_usart_handler,buf[len]);
//	}
}

void esp_usart_send_line(const char buf[])
{
	esp_usart_send_str(buf);
	esp_usart_send_str("\r\n");
}




