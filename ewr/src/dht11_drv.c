/*
 * Copyright (C) 2017 C-SKY Microsystems Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>
#include <time.h>

#include <errno.h>
#include <pin.h>
#include <soc.h>
#include <aos/kernel.h>
#include <drv_gpio.h>
#include <drv_timer.h>

#include <devices/sensor.h>

#define SENSOR_DATA_LEN         40
#define DHT_SENSOR_MDELAY       30 /* ms*/
#define DHT_SENSOR_UDELAY       40 /* us*/
#define DHT_SENSOR_COUNTS       10000

static const char* TAG =  "dht11";

extern void mdelay(uint32_t ms);
extern void udelay(uint32_t us);

typedef enum {
    SENSOR_HUMIDIYT = 0,
    SENSOR_TEMPERATURE,
} sensor_chan_e;

typedef struct sensor_dev {
    dev_t               device;
    gpio_pin_handle_t   handle;
    uint8_t             recv_buf[16];
} sensor_dev_t;

static int get_level(dev_t *dev)
{
    sensor_dev_t *sensor = (sensor_dev_t*)dev;
    bool value;

    csi_gpio_pin_read(sensor->handle, &value);

    return value;
}

static inline int read_level(dev_t *dev, int count, int sign_value)
{
    sensor_dev_t *sensor = (sensor_dev_t*)dev;
    bool value;

    do {
        csi_gpio_pin_read(sensor->handle, &value);

        if (count-- == 0) {
            return -1;
        }
    } while (value == sign_value);

    return 0;
}


static dev_t *dht11_init(driver_t *drv,void *config, int id)
{
    sensor_dev_t *dev = (sensor_dev_t*)device_new(drv, sizeof(sensor_dev_t), id);

    dev->device.config = config;

    return (dev_t*)dev;
}

#define dht11_uninit device_free

static int dht11_lpm(dev_t *dev, int state)
{
    return 0;
}

static int dht11_open(dev_t *dev)
{
    sensor_dev_t *sensor = (sensor_dev_t*)dev;

    sensor->handle = csi_gpio_pin_initialize(((sensor_pin_config_t *)sensor->device.config)->pin, NULL);
    csi_gpio_pin_config(sensor->handle, GPIO_MODE_OPEN_DRAIN, GPIO_DIRECTION_OUTPUT);
    csi_gpio_pin_write(sensor->handle, 1);

    return 0;
}

static int dht11_close(dev_t *dev)
{
    sensor_dev_t *sensor = (sensor_dev_t*)dev;

    csi_gpio_pin_uninitialize(sensor->handle);
    return 0;
}

static int read_data(dev_t *dev)
{
    sensor_dev_t *sensor = (sensor_dev_t*)dev;
    int i = 0;
    int j = 0;

    // wait DHT11 device state machine reset after one transfer over
    sleep(2);

    memset(sensor->recv_buf, 0, sizeof(sensor->recv_buf));

    csi_gpio_pin_config(sensor->handle, GPIO_MODE_OPEN_DRAIN, GPIO_DIRECTION_OUTPUT);
    /* set gpio low level*/
    csi_gpio_pin_write(sensor->handle, 0);
    udelay(20000);
    /* set gpio high level*/
    csi_gpio_pin_write(sensor->handle, 1);
    udelay(40);

    /* set gpio mode: input*/
    csi_gpio_pin_config(sensor->handle, GPIO_MODE_PULLUP, GPIO_DIRECTION_INPUT);

    /* wait high level*/
    if (read_level(dev, DHT_SENSOR_COUNTS, 0) < 0) {
        LOGE(TAG, "wait high err");
        return -1;
    }

    /* start read bit*/
    for (i = 0; i < SENSOR_DATA_LEN; i++) {
        // wait low level
        if (read_level(dev, DHT_SENSOR_COUNTS, 1) < 0) {
            LOGE(TAG, "wait data low err, %d\n", i);
            return -1;
        }
        // wait high levels
        if (read_level(dev, DHT_SENSOR_COUNTS, 0) < 0) {
            LOGE(TAG, "wait data high err, %d\n", i);
            return -1;
        }

        udelay(50);

        if (get_level(dev) == 0) {
            sensor->recv_buf[j] = sensor->recv_buf[j] << 1;
        } else {
            sensor->recv_buf[j] = (sensor->recv_buf[j] << 1) | 1;
        }

        if (i % 8 == 7) {
            j++;
        }
    }

    csi_gpio_pin_config(sensor->handle, GPIO_MODE_OPEN_DRAIN, GPIO_DIRECTION_OUTPUT);
    csi_gpio_pin_write(sensor->handle, 1);

    return 0;
}

static int data_check(dev_t *dev)
{
    sensor_dev_t *sensor = (sensor_dev_t*)dev;

    int humi, humi2, temp, temp2, tol;

    /* get humi data*/
    humi = sensor->recv_buf[0];
    humi2 = sensor->recv_buf[1];
    /* get temp data*/
    temp = sensor->recv_buf[2];
    temp2 = sensor->recv_buf[3];
    /* get tol data*/
    tol = sensor->recv_buf[4];

    if (tol == (humi + humi2 + temp + temp2)) {
        return 0;
    } else if (humi > 10) {
        LOGE(TAG, "get humi err\n");
        return -1;
    } else {
        LOGE(TAG, "check err");
        return -1;
    }
}

static int dht11_fetch(dev_t *dev)
{
    int ret;

    ret = read_data(dev);
    if (ret == 0) {
        ret = data_check(dev);
    }

    if (ret < 0) {
        return -1;
    }

    return 0;
}

static int dht11_get(dev_t *dev, void *value, size_t size)
{
    sensor_dev_t *sensor = (sensor_dev_t*)dev;

    if ((size < sizeof (sensor_dht11_t)) || (value == NULL)) {
        return -EINVAL;
    }

    ((sensor_dht11_t *)value)->rh = sensor->recv_buf[0] * 10 + sensor->recv_buf[1];
    ((sensor_dht11_t *)value)->degree = sensor->recv_buf[2] * 10 + sensor->recv_buf[3];

    return 0;
}

static sensor_driver_t sensor_driver = {
    .drv = {
        .name   = "dht",
        .type   = "sensor",
        .init   = dht11_init,
        .uninit = dht11_uninit,
        .lpm    = dht11_lpm,
        .open   = dht11_open,
        .close  = dht11_close,
    },
    .fetch      = dht11_fetch,
    .getvalue   = dht11_get,
};

void app_sensor_dht11_register(void *config, int idx)
{
    driver_register(&sensor_driver.drv, config, idx);
}
