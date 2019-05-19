#include "my_device.h"
#include "my_led.h"
#include "my_pwm.h"
#include "delay.h"
#include "esp8266.h"
#include "my_dht11.h"
#include "my_oled.h"
#include "my_vol.h"
#include "my_usart.h"

void device_init(void)
{
	my_pwm_init(PA13);
	led_init(LED3);
	esp_usart_init(ESP_USART_INDEX);
	my_dht11_init();
	my_oled_init();
	
	
	
}