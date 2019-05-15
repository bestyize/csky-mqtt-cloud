#ifndef _ESP8266_H
#define _ESP8266_H
#include "stdint.h"
#include "stdbool.h"


#define ESP_USART_INDEX 0
#define USART0_MAX_RECEIVE_COUNT 0x8

/*串口接收结构体*/
typedef struct{
	uint8_t buf[USART0_MAX_RECEIVE_COUNT];
	uint8_t count;
	bool finish;
}usart_receive;


extern usart_receive esp_usart_receive;

void esp_usart_receive_init();
void esp_wait_reply();
void esp_usart_init(int32_t uart_idx);
void esp_usart_send_str(const char buf[]);
void esp_usart_send_line(const char buf[]);
#endif