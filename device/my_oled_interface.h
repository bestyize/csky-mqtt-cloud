#ifndef _MY_OLED_INTERFACE_H
#define _MY_OLED_INTERFACE_H
#include "stdbool.h"

void oled_pin_init();
void oled_scl_out_high();
void oled_scl_out_low();
void oled_sda_out_high();
void oled_sda_out_low();
void oled_res_out_high();
void oled_res_out_low();
void oled_dc_out_high();
void oled_dc_out_low();

#endif