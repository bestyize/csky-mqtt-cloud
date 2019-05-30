#include "my_finger_interface.h"
#include "stdio.h"
#include "drv_gpio.h"
#include "drv_usart.h"
#include "stdint.h"
#include "stdbool.h"
#include "pin_name.h"
#include "pin.h"
#include "oled.h"

/********************************************************************************************
 * 
 * 指纹模块所用的串口模块
 * 
 * 
 **********************************************************************************************/
usart_handle_t finger_handle;
#define FINGER_TX_PIN PA10
#define FINGER_RX_PIN PA11

#define FINGER_TXD_FUNC    PA10_UART0_TX
#define FINGER_RXD_FUNC    PA11_UART0_RX
#define FINGER_USART_INDEX 0
/*
 * 
 * 所用到的串口初始化
 * */
void my_finger_usart_init()
{
	drv_pinmux_config(FINGER_TX_PIN, FINGER_TXD_FUNC);
    drv_pinmux_config(FINGER_RX_PIN, FINGER_RXD_FUNC);
    /* init the console*/
    finger_handle = csi_usart_initialize(FINGER_USART_INDEX, NULL);
    /* config the UART */
    csi_usart_config(finger_handle, 57600, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
}

/**
 * 发送一个字符
 **/
void my_finger_send_char(uint8_t ch)
{
	csi_usart_putchar(finger_handle,ch);
}

/**
 * 
 * 发送一段信息
 * */
void my_finger_send_str(uint8_t *dat)
{
	while(*dat){
		csi_usart_putchar(finger_handle,*dat++);
	} 
 }
 
 /*
 * Author 		:yize
 * Date   		:2019-5-5
 * Function		:同步接收消息函数（除了超时外，接受不完不退出）
 * usart        :串口句柄
 * data         :等待接受的数据指针，接收完后就放在data里面了
 * num          :等待接收到的数据量
 * */
int usart_receive_sync( void *data, uint32_t num)
{
    int time_out = 0x7ffff;
    usart_status_t status;

    csi_usart_receive(finger_handle, data, num);

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(finger_handle);

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
  * 接受一定数量的信息
  * buf是存放地址，number是数量
  * */
void my_finger_receive_str(uint8_t buf[],int number)
{
	csi_usart_receive(finger_handle,&buf,number);
}

uint8_t my_finger_receive_char()
{
	uint8_t ch;
	usart_receive_sync(&ch,1);
	return ch;
}

/********************************************************************************************
 * 
 * 指纹模块所用的显示模块
 * 
 * 
 **********************************************************************************************/

void my_finger_clear_display()
{
	//调用OLED的清屏
	OLED_Clear();
}

void my_finger_show_str(uint8_t x,uint8_t y,uint8_t *dat)
{
	//调用OLED的字符串显示程序
	OLED_ShowString(x,y,dat);
}


/********************************************************************************************
 * 
 * 指纹模块所用的延时模块
 * 
 * 
 **********************************************************************************************/
 /*
  * 
  * 毫秒延时
  * 
  * */
void my_finger_delay_ms(uint32_t ms)
{
	delay_ms(ms);
}
/*
 * 微秒延时
 * 
 * */
void my_finger_delay_us(uint32_t us)
{
	delay_us(us);
}

/********************************************************************************************
 * 
 * 指纹模块所用的按键模块
 * 
 * 
 **********************************************************************************************/
#define BUTTON_UP_PIN 		PA4
#define BUTTON_DOWM_PIN 	PA5
#define BUTTON_OK_PIN 		PA26
#define BUTTON_CANCEL_PIN 	PA27

static gpio_pin_handle_t button_up_handle,button_down_handle,button_ok_handle,button_cancel_handle;
/*
 * 四个按键的中断服务程序,暂时没有用，51的工程没有用到中断，只是读引脚的电平
 * */
void button_up_event_handle(uint32_t pin_index)
{
	
}
void button_down_event_handle(uint32_t pin_index)
{
	
}
void button_ok_event_handle(uint32_t pin_index)
{
	
}
void button_cancel_event_handle(uint32_t pin_index)
{
	
}



/*
 * 按键初始化
 * */
void my_finger_button_init()
{
	button_up_handle=csi_gpio_pin_initialize(BUTTON_UP_PIN,button_up_event_handle);
	csi_gpio_pin_config(button_up_handle,GPIO_MODE_PULLDOWN,GPIO_DIRECTION_INPUT);
	csi_gpio_pin_set_irq(button_up_handle,GPIO_IRQ_MODE_LOW_LEVEL,true);
	
	button_down_handle=csi_gpio_pin_initialize(BUTTON_DOWM_PIN,button_up_event_handle);
	csi_gpio_pin_config(button_down_handle,GPIO_MODE_PULLDOWN,GPIO_DIRECTION_INPUT);
	csi_gpio_pin_set_irq(button_down_handle,GPIO_IRQ_MODE_LOW_LEVEL,true);
	
	button_ok_handle=csi_gpio_pin_initialize(BUTTON_OK_PIN,button_up_event_handle);
	csi_gpio_pin_config(button_ok_handle,GPIO_MODE_PULLDOWN,GPIO_DIRECTION_INPUT);
	csi_gpio_pin_set_irq(button_ok_handle,GPIO_IRQ_MODE_LOW_LEVEL,true);
	
	button_cancel_handle=csi_gpio_pin_initialize(BUTTON_CANCEL_PIN,button_up_event_handle);
	csi_gpio_pin_config(button_cancel_handle,GPIO_MODE_PULLDOWN,GPIO_DIRECTION_INPUT);
	csi_gpio_pin_set_irq(button_cancel_handle,GPIO_IRQ_MODE_LOW_LEVEL,true);
	
}

/**
 * 读取四个按键的状态
 * */
bool my_finger_button_up_read()
{
	bool status;
	csi_gpio_pin_read(button_up_handle,&status);
	return status;
}

bool my_finger_button_down_read()
{
	bool status;
	csi_gpio_pin_read(button_down_handle,&status);
	return status;
}
bool my_finger_button_ok_read()
{
	bool status;
	csi_gpio_pin_read(button_ok_handle,&status);
	return status;
}
bool my_finger_button_cancel_read()
{
	bool status;
	csi_gpio_pin_read(button_cancel_handle,&status);
	return status;
}


