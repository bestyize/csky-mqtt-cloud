#ifndef _MY_USART_H
#define _MY_USART_H
#include "stdint.h"

void my_usart_init(uint32_t baud_rate);
void my_usart_send_str(const char *params);

#endif