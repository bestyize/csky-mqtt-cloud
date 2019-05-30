#ifndef _MY_FINGER_INTERFACE_H
#define _MY_FINGER_INTERFACE_H
#include "stdint.h"
#include "stdbool.h"
#include "drv_usart.h"
void my_finger_usart_init();
int usart_receive_sync( void *data, uint32_t num);
void my_finger_send_char(uint8_t ch);
void my_finger_send_str(uint8_t *dat);
void my_finger_receive_str(uint8_t buf[],int number);
uint8_t my_finger_receive_char();


void my_finger_clear_display();
void my_finger_show_str(uint8_t x,uint8_t y,uint8_t *dat);


void my_finger_delay_us(uint32_t us);
void my_finger_delay_ms(uint32_t ms);

void my_finger_button_init();
bool my_finger_button_up_read();
bool my_finger_button_down_read();
bool my_finger_button_ok_read();
bool my_finger_button_cancel_read();

extern usart_handle_t finger_handle;

#endif