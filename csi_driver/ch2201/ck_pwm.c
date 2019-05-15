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

/******************************************************************************
 * @file     ck_pwm.c
 * @brief    CSI Source File for PWM Driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/

#include <csi_config.h>
#include "ck_pwm.h"
#include "drv_pwm.h"
#include "soc.h"

#define ERR_PWM(errno) (CSI_DRV_ERRNO_PWM_BASE | errno)

#define PWM_NULL_PARAM_CHK(para)  HANDLE_PARAM_CHK(para, ERR_PWM(DRV_ERROR_PARAMETER))

typedef struct {
#ifdef CONFIG_LPM
    uint8_t pwm_power_status;
    uint32_t pwm_regs_saved[36];
#endif
    uint32_t base;
    uint32_t irq;
    uint32_t idx;
} ck_pwm_priv_t;

extern int32_t target_pwm_init(uint32_t idx, uint32_t *base, uint32_t *irq);
extern int32_t csi_pwm_power_control(pwm_handle_t handle, csi_power_stat_e state);

static ck_pwm_priv_t pwm_instance[CONFIG_PWM_NUM];

#ifdef CONFIG_LPM
static void manage_clock(pwm_handle_t handle, uint8_t enable)
{
    drv_clock_manager_config(CLOCK_MANAGER_PWM, enable);
}

static void do_prepare_sleep_action(pwm_handle_t handle)
{
    ck_pwm_priv_t *pwm_priv = handle;
    uint32_t *abase = (uint32_t *)(pwm_priv->base);
    registers_save(pwm_priv->pwm_regs_saved, abase, 7);
    registers_save(&pwm_priv->pwm_regs_saved[7], abase + 9, 2);
    registers_save(&pwm_priv->pwm_regs_saved[9], abase + 13, 4);
    registers_save(&pwm_priv->pwm_regs_saved[13], abase + 20, 11);
    registers_save(&pwm_priv->pwm_regs_saved[24], abase + 32, 1);
    registers_save(&pwm_priv->pwm_regs_saved[25], abase + 37, 4);
    registers_save(&pwm_priv->pwm_regs_saved[29], abase + 42, 1);
    registers_save(&pwm_priv->pwm_regs_saved[30], abase + 44, 6);
}

static void do_wakeup_sleep_action(pwm_handle_t handle)
{
    ck_pwm_priv_t *pwm_priv = handle;
    uint32_t *abase = (uint32_t *)(pwm_priv->base);
    registers_restore(abase, pwm_priv->pwm_regs_saved, 7);
    registers_restore(abase + 9, &pwm_priv->pwm_regs_saved[7], 2);
    registers_restore(abase + 13, &pwm_priv->pwm_regs_saved[9], 4);
    registers_restore(abase + 20, &pwm_priv->pwm_regs_saved[13], 11);
    registers_restore(abase + 32, &pwm_priv->pwm_regs_saved[24], 1);
    registers_restore(abase + 37, &pwm_priv->pwm_regs_saved[25], 4);
    registers_restore(abase + 42, &pwm_priv->pwm_regs_saved[29], 1);
    registers_restore(abase + 44, &pwm_priv->pwm_regs_saved[30], 6);
}
#endif

/**
  \brief       Initialize PWM Interface. 1. Initializes the resources needed for the PWM interface 2.registers event callback function
  \param[in]   idx pwm idx
  \return      handle pwm handle to operate.
*/
pwm_handle_t csi_pwm_initialize(uint32_t idx)
{
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_pwm_init(idx, &base, &irq);

    if (ret != idx || ret < 0) {
        return NULL;
    }

    ck_pwm_priv_t *pwm_priv = &pwm_instance[idx];

    pwm_priv->base      = base;
    pwm_priv->irq       = irq;

#ifdef CONFIG_LPM
    csi_pwm_power_control(pwm_priv, DRV_POWER_FULL);
#endif

    return pwm_priv;
}

/**
  \brief       De-initialize PWM Interface. stops operation and releases the software resources used by the interface
  \param[in]   handle pwm handle to operate.
*/
void csi_pwm_uninitialize(pwm_handle_t handle)
{
#ifdef CONFIG_LPM
    ck_pwm_priv_t *pwm_priv = handle;
    csi_pwm_power_control(pwm_priv, DRV_POWER_OFF);
#endif
}

int32_t csi_pwm_power_control(pwm_handle_t handle, csi_power_stat_e state)
{
    PWM_NULL_PARAM_CHK(handle);

#ifdef CONFIG_LPM
    power_cb_t callback = {
        .wakeup = do_wakeup_sleep_action,
        .sleep = do_prepare_sleep_action,
        .manage_clock = manage_clock
    };
    return drv_soc_power_control(handle, state, &callback);
#else
    return ERR_PWM(DRV_ERROR_UNSUPPORTED);
#endif
}

static void ck_pwm_div(ck_pwm_priv_t *pwm_priv, uint8_t div)
{
    ck_pwm_reg_t *addr = (ck_pwm_reg_t *)(pwm_priv->base);
    addr->PWMCFG &= ~(7 << 24);

    switch (div) {
        case 1:
            addr->PWMCFG &= ~(PWM_CFG_CNTDIV_EN);
            break;

        case 2:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_2;
            break;

        case 4:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_4;
            break;

        case 8:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_8;
            break;

        case 16:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_16;
            break;

        case 32:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_32;
            break;

        case 64:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_64;
            break;

        case 128:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_128;
            break;

        default:
            break;
    }
}
/**
  \brief       config pwm mode.
  \param[in]   handle           pwm handle to operate.
  \param[in]   channel          channelnel num.
  \param[in]   period_us        the PWM period in us
  \param[in]   pulse_width_us   the PMW pulse width in us
  \return      error code
*/
int32_t csi_pwm_config(pwm_handle_t handle, uint8_t channel, uint32_t period_us, uint32_t pulse_width_us)
{
    PWM_NULL_PARAM_CHK(handle);

    if (pulse_width_us > period_us) {
        return ERR_PWM(DRV_ERROR_PARAMETER);
    }

    ck_pwm_priv_t *pwm_priv = handle;
    uint32_t counter;
    uint8_t cnt_div[8] = {1, 2, 4, 8, 16, 32, 64, 128};
    uint8_t count_div;

    for (count_div = 0; count_div <  sizeof(cnt_div) / sizeof(uint8_t); count_div++) {
        ck_pwm_div(pwm_priv, cnt_div[count_div]);
        counter = (drv_get_sys_freq() / 1000000 * period_us / cnt_div[count_div]);

        if ((counter <= 0xffff)) {
            break;
        }
    }

    if (count_div >= sizeof(cnt_div) / sizeof(uint8_t)) {
        return ERR_PWM(DRV_ERROR_PARAMETER);
    }

    uint32_t cmp_counter = (drv_get_sys_freq() / 1000000 * pulse_width_us / cnt_div[count_div]);

    ck_pwm_reg_t *addr = (ck_pwm_reg_t *)(pwm_priv->base);
    uint32_t ctl_tmp = addr->PWMCTL;
    uint32_t temp;

    if (channel == CKENUM_PWM_CH0 || channel == CKENUM_PWM_CH1) {
        ctl_tmp &= 0xfffffffe;
        addr->PWMCTL = ctl_tmp | (uint32_t)CKENUM_PWM_COUNT_UP;

        temp = addr->PWM01LOAD;
        temp &= 0xffff0000;
        addr->PWM01LOAD = temp | counter;

        temp = addr->PWM0CMP;

        if (channel == CKENUM_PWM_CH0) {
            temp &= 0xffff0000;
            addr->PWM0CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM0CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == CKENUM_PWM_CH2 || channel == CKENUM_PWM_CH3) {
        ctl_tmp &= 0xfffffffd;
        addr->PWMCTL = ctl_tmp | (uint32_t)CKENUM_PWM_COUNT_UP << 1;

        temp = addr->PWM01LOAD;
        temp &= 0x0000ffff;
        addr->PWM01LOAD = temp | counter << 16 ;

        temp = addr->PWM1CMP;

        if (channel == CKENUM_PWM_CH2) {
            temp &= 0xffff0000;
            addr->PWM1CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM1CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == CKENUM_PWM_CH4 || channel == CKENUM_PWM_CH5) {
        ctl_tmp &= 0xfffffffb;
        addr->PWMCTL = ctl_tmp | (uint32_t)CKENUM_PWM_COUNT_UP << 2;

        temp = addr->PWM23LOAD;
        temp &= 0xffff0000;
        addr->PWM23LOAD = temp | counter;

        temp = addr->PWM2CMP;

        if (channel == CKENUM_PWM_CH4) {
            temp &= 0xffff0000;
            addr->PWM2CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM2CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == CKENUM_PWM_CH6 || channel == CKENUM_PWM_CH7) {
        ctl_tmp &= 0xfffffff7;
        addr->PWMCTL = ctl_tmp | (uint32_t)CKENUM_PWM_COUNT_UP << 3;

        temp = addr->PWM23LOAD;
        temp &= 0x0000ffff;
        addr->PWM23LOAD = temp | counter << 16 ;

        temp = addr->PWM3CMP;

        if (channel == CKENUM_PWM_CH6) {
            temp &= 0xffff0000;
            addr->PWM3CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM3CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == CKENUM_PWM_CH8 || channel == CKENUM_PWM_CH9) {
        ctl_tmp &= 0xffffffef;
        addr->PWMCTL = ctl_tmp | (uint32_t)CKENUM_PWM_COUNT_UP << 4;

        temp = addr->PWM45LOAD;
        temp &= 0xffff0000;
        addr->PWM45LOAD = temp | counter ;

        temp = addr->PWM4CMP;

        if (channel == CKENUM_PWM_CH8) {
            temp &= 0xffff0000;
            addr->PWM4CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM4CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == CKENUM_PWM_CH10 || channel == CKENUM_PWM_CH11) {
        ctl_tmp &= 0xffffffdf;
        addr->PWMCTL = ctl_tmp | (uint32_t)CKENUM_PWM_COUNT_UP << 5;

        temp = addr->PWM45LOAD;
        temp &= 0x0000ffff;
        addr->PWM45LOAD = temp | counter << 16 ;

        temp = addr->PWM5CMP;

        if (channel == CKENUM_PWM_CH10) {
            temp &= 0xffff0000;
            addr->PWM5CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM5CMP = temp | cmp_counter << 16;
        }
    }

    return 0;
}

/**
  \brief       start generate pwm signal.
  \param[in]   handle pwm handle to operate.
  \param[in]   channel  chnnel num.
  \return      \ref execution_status
*/
void csi_pwm_start(pwm_handle_t handle, uint8_t channel)
{
    ck_pwm_priv_t *pwm_priv = handle;
    ck_pwm_reg_t *addr = (ck_pwm_reg_t *)(pwm_priv->base);

    if (channel == CKENUM_PWM_CH0 || channel == CKENUM_PWM_CH1) {
        addr->PWMCFG |= 0x00000003;        /* PWM0 output enable */
    }

    if (channel == CKENUM_PWM_CH2 || channel == CKENUM_PWM_CH3) {
        addr->PWMCFG |= 0x0000000C;        /* PWM1 output enable */
    }

    if (channel == CKENUM_PWM_CH4 || channel == CKENUM_PWM_CH5) {
        addr->PWMCFG |= 0x00000030;        /* PWM2 output enable */
    }

    if (channel == CKENUM_PWM_CH6 || channel == CKENUM_PWM_CH7) {
        addr->PWMCFG |= 0x000000C0;        /* PWM3 output enable */
    }

    if (channel == CKENUM_PWM_CH8 || channel == CKENUM_PWM_CH9) {
        addr->PWMCFG |= 0x00000300;        /* PWM4 output enable */
    }

    if (channel == CKENUM_PWM_CH10 || channel == CKENUM_PWM_CH11) {
        addr->PWMCFG |= 0x00000C00;        /* PWM5 output enable */
    }
}

/**
  \brief       Stop generate pwm signal.
  \param[in]   handle pwm handle to operate.
  \param[in]   channel  chnnel num.
  \return      \ref execution_status
*/
void  csi_pwm_stop(pwm_handle_t handle, uint8_t channel)
{
    ck_pwm_priv_t *pwm_priv = handle;
    ck_pwm_reg_t *addr = (ck_pwm_reg_t *)(pwm_priv->base);

    if (channel == CKENUM_PWM_CH0 || channel == CKENUM_PWM_CH1) {
        addr->PWMCFG &= ~0x00000003;        /* PWM0 output disable */
    }

    if (channel == CKENUM_PWM_CH2 || channel == CKENUM_PWM_CH3) {
        addr->PWMCFG &= ~0x0000000C;        /* PWM1 output disable */
    }

    if (channel == CKENUM_PWM_CH4 || channel == CKENUM_PWM_CH5) {
        addr->PWMCFG &= ~0x00000030;        /* PWM2 output disable */
    }

    if (channel == CKENUM_PWM_CH6 || channel == CKENUM_PWM_CH7) {
        addr->PWMCFG &= ~0x000000C0;        /* PWM3 output disable */
    }

    if (channel == CKENUM_PWM_CH8 || channel == CKENUM_PWM_CH9) {
        addr->PWMCFG &= ~0x00000300;        /* PWM4 output disable */
    }

    if (channel == CKENUM_PWM_CH10 || channel == CKENUM_PWM_CH11) {
        addr->PWMCFG &= ~0x00000C00;        /* PWM5 output disable */
    }
}

