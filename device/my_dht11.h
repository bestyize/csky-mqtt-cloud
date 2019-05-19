#ifndef _MY_DHT11_H
#define _MY_DHT11_H
#include "stdbool.h"
#include "stdint.h"



uint8_t my_dht11_init();
void get_temp_humi(char data[]);

extern uint8_t temperature_value;
extern uint8_t humidity_value;


#endif