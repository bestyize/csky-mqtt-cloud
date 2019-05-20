#ifndef _BMP280_PIN_INIT
#define _BMP280_PIN_INIT
#include "stdbool.h"
#include "stdint.h"
void bmp280_pin_init(void);
void bmp_scl_pin_out(bool status);
void bmp_sda_pin_out(bool status);
uint8_t bmp_sda_pin_read(void);
void bmp_delay_ms(uint32_t ms);
void bmp_delay_us(uint32_t us);



#endif
