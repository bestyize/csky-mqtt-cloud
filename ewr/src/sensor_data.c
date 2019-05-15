/****************************************************************************
 *
 * Copyright (C) 2017 C-SKY Microsystems Co., All rights reserved.
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <yoc_config.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <aos/kernel.h>
#include <aos/log.h>

#include <devices/sensor.h>


/*payload sample
* {"type":1,"val":20}
* type:1  temperature
* type:2  humidity
*/
#define PAYLOAD_FMT "{\"type\":%d,\"val\":%d}"

static const char *TAG = "T&H";

static int g_humi_value = -1000;
static int g_temp_value = -1000;


static void get_sensor_value(char *name)
{
    dev_t *sensor_dev;
    sensor_dht11_t sval;
    int ret, i;

    g_humi_value = -1000;
    g_temp_value = -1000;

    LOGD(TAG, "capture T&H data");

    sensor_dev = sensor_open(name);
    if (sensor_dev == NULL) {
        LOGE(TAG, "no %s driver", name);
        return;
    }

    for (i = 0; i < 3; i++) {
        ret = sensor_fetch(sensor_dev);

        if (ret == 0) {
            break;
        }

        LOGE(TAG, "retry");
        aos_msleep(50);
    }

    if (ret) {
        sensor_close(sensor_dev);
        return;
    }

    if (sensor_getvalue(sensor_dev, (void *)&sval, sizeof(sensor_dht11_t)) < 0) {
        sensor_close(sensor_dev);
        return;
    }

    sensor_close(sensor_dev);

    g_temp_value = sval.degree / 10;
    g_humi_value = sval.rh / 10;

    LOGI(TAG, "Temp=%d Humi=%d", g_temp_value, g_humi_value);
}

int temperature_capture(char *name, int *payload, int len)
{
    int ret = -1;

    if (g_temp_value == -1000) {
        get_sensor_value(name);
    }

    if (g_temp_value > -1000) {
        *payload = g_temp_value;
    }

    /* clear value, will capture again*/
    g_temp_value = -1000;

    return ret;
}

int humidity_capture(char *name, int *payload, int len)
{
    int ret = -1;

    if (g_humi_value == -1000) {
        get_sensor_value(name);
    }

    if (g_humi_value > -1000) {
        *payload = g_humi_value;
    }

    /* clear value, will capture again*/
    g_humi_value = -1000;

    return ret;
}
