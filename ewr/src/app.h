/****************************************************************************
 *
 * Copyright (C) 2017 C-SKY Microsystems Co., All rights reserved.
 ****************************************************************************/

#ifndef __APP_H__
#define __APP_H__
#include <stdint.h>

#if 1
#define SENSOR_NAME "simulate"
#else
#define SENSOR_NAME "dht"
#endif

void app_sensor_dht11_register(void *config, int idx);
int temperature_capture(char *name, int *payload, int len);
int humidity_capture(char *name, int *payload, int len);

void app_exception_event(uint32_t event_id);

/* user define event */
#define EVENT_DATA_REPORT  (EVENT_USER + 1)
#define EVENT_CHANNEL_CHECK (EVENT_USER + 2)
#define EVENT_CHANNEL_CLOSE (EVENT_USER + 3)

#endif /* __APP_H__ */

