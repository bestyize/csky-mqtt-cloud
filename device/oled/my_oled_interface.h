#ifndef _MY_OLED_INTERFACE_H
#define _MY_OLED_INTERFACE_H
#include "stdbool.h"

void my_oled_delay_ms(int ms);
void my_oled_pin_init(void);
void my_oled_scl_out(bool status);
void my_oled_sda_out(bool status);

#endif