#include <yoc_config.h>

#include <stdbool.h>
#include <aos/aos.h>
#include <yoc/yoc.h>
#include <yoc/sysinfo.h>
#include <devices/devicelist.h>
#include <pin.h>

#include "app_init.h"

#define KV_STR_LEN  32

netmgr_hdl_t app_netmgr_hdl;

#if defined(CONFIG_TCPIP_ENC28J60) && CONFIG_TCPIP_ENC28J60
static void gen_eth_mac(unsigned char mac[])
{
    char *did = aos_get_device_id();

    if (did && strlen(did) > 12) {
         str2mac(&did[strlen(did) - 12], mac);
    } else {
        int random = rand();
        mac[2] = (random >> 24) & 0xFF;
        mac[3] = (random >> 16) & 0xFF;
        mac[4] = (random >> 8) & 0xFF;
        mac[5] = (random) & 0xFF;
    }

    mac[0] = 0x00;
    mac[1] = 0x11;
}
#endif

static void network_init()
{
    // network init
#if defined(CONFIG_SAL_ESP8266) && CONFIG_SAL_ESP8266
    /* kv config check */
    aos_kv_setint("wifi_en", 1);
    aos_kv_setint("gprs_en", 0);
    aos_kv_setint("eth_en", 0);

    esp_wifi_param_t esp_param;

    esp_param.device_name    = "uart2";
    esp_param.baud           = 115200;
    esp_param.buf_size       = 4096;
    esp_param.enable_flowctl = 0;
    esp_param.reset_pin      = WIFI_ESP8266_RESET;
    esp_param.smartcfg_pin   = WIFI_ESP8266_SMARTCFG;

    wifi_esp8266_register(NULL, &esp_param);
    app_netmgr_hdl = netmgr_dev_wifi_init();
#endif

#if defined(CONFIG_SAL_SIM800C) && CONFIG_SAL_SIM800C

    /* kv config check */
    aos_kv_setint("gprs_en", 1);
    aos_kv_setint("wifi_en", 0);
    aos_kv_setint("eth_en", 0);

    sim_gprs_param_t sim_param;
    sim_param.baud           = 115200;
    sim_param.buf_size       = 4096;
    sim_param.enable_flowctl = 0;
    sim_param.device_name    = "uart1";
    sim_param.reset_pin      = GPRS_SIM800_PIN_PWR;
    sim_param.state_pin      = GPRS_SIM800_PIN_STATUS;

    gprs_sim800_register(NULL, &sim_param);
    app_netmgr_hdl = netmgr_dev_gprs_init();
#endif

#if defined(CONFIG_TCPIP_ENC28J60) && CONFIG_TCPIP_ENC28J60

    /* kv config check */
    char strip[24] = "";
    aos_kv_getstring("ip_addr", strip, sizeof(strip));

    aos_kv_setint("eth_en", 1);

    if (strlen(strip) < 8) {
        aos_kv_setint("dhcp_en", 1);
    }

    aos_kv_setint("wifi_en", 0);
    aos_kv_setint("gprs_en", 0);

    char str[KV_STR_LEN];
    int len;

    enc28j60_pin_t pin_param = {
        .enc28j60_spi_idx = 0,
        .enc28j60_spi_rst = ENC28J60_ETH_PIN_RST,
        .enc28j60_spi_cs  = ENC28J60_ETH_SPI_CS,
        .enc28j60_spi_interrupt = ENC28J60_ETH_PIN_INT,
    };
    eth_config_t eth_param;

    eth_param.net_pin = &pin_param;

    memset(str, 0, KV_STR_LEN);
    len = KV_STR_LEN;

    if (aos_kv_get("eth_mac", str, &len) == 0 && len >= 17) {
        str2mac(str, eth_param.mac);
    } else {
        gen_eth_mac(eth_param.mac);
    }

    eth_enc26j60_register(&eth_param);
    app_netmgr_hdl = netmgr_dev_eth_init();
#endif

    if (app_netmgr_hdl) {
        netmgr_service_init(NULL);
        netmgr_start(app_netmgr_hdl);
    }
}

void board_yoc_init(void)
{
#ifdef CONSOLE_ID
    console_init(CONSOLE_ID, 115200, 128);
#else
    console_init(0, 115200, 128);
#endif
    nvram_init("factory");

    /* uService init */
    utask_t *task = utask_new("at&cli", 2 * 1024, QUEUE_MSG_COUNT, AOS_DEFAULT_APP_PRI);

#if defined(CONFIG_AT) && CONFIG_AT
    at_server_init(task);
#endif
    board_cli_init(task);

    network_init();
}
