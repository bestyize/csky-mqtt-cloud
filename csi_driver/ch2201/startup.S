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
 * @file     startup.S
 * @brief    startup file for CH2201. Should use with
 *           GCC for CSKY Embedded Processors
 * @version  V1.0
 * @date     24. August 2017
 ******************************************************************************/

#include <csi_config.h>

#define AHB_BASE        0x40000000
#undef  EFLASH_CONTROL_BASE
#define EFLASH_CONTROL_BASE  0x4003f000

#undef  PMU_LP_CONTROL
#define PMU_LP_CONTROL  0x40002000

#undef  PMU_MCLK_SEL
#define PMU_MCLK_SEL   0x40002004

#undef  PMU_CLK_STABLE
#define PMU_CLK_STABLE 0x40002018

#undef  PMU_PLL_CTRL
#define PMU_PLL_CTRL   0x4000202c


.section .vectors
    .align 10
    .globl   __Vectors
    .type    __Vectors, @object
__Vectors:
    .long   Reset_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   trap0_handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
#ifdef CONFIG_KERNEL_NONE
    /* External interrupts */
    .long   GPIO0_IRQHandler         /*  0:  GPIO           */
    .long   CORET_IRQHandler         /*  1:  CoreTIM        */
    .long   TIMA0_IRQHandler         /*  2:  TimerA0        */
    .long   TIMA1_IRQHandler         /*  3:  TimerA1        */
    .long   I2S_IRQHandler           /*  4:  I2S            */
    .long   WDT_IRQHandler           /*  5:  WDT            */
    .long   USART0_IRQHandler        /*  6:  UART0          */
    .long   USART1_IRQHandler        /*  7:  UART1          */
    .long   USART2_IRQHandler        /*  8:  UART2          */
    .long   I2C0_IRQHandler          /*  9:  I2C0           */
    .long   I2C1_IRQHandler          /*  10: I2C1           */
    .long   SPI1_IRQHandler          /*  11: SPI1           */
    .long   SPI0_IRQHandler          /*  12: SPI0           */
    .long   RTC_IRQHandler           /*  13: RTC            */
    .long   Default_Handler
    .long   ADC_IRQHandler           /*  15: ADC            */
    .long   Default_Handler
    .long   DMAC0_IRQHandler         /*  17: DMAC0          */
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   Default_Handler
    .long   DMAC1_IRQHandler         /*  22: DMAC1          */
    .long   TIMB0_IRQHandler         /*  23: TimerB0        */
    .long   TIMB1_IRQHandler         /*  24: TimerB1        */
    .long   RTC1_IRQHandler          /*  25: RTC1           */
    .long   AES_IRQHandler           /*  26: AES            */
    .long   GPIO1_IRQHandler
    .long   RSA_IRQHandler           /*  28: RSA            */
    .long   SHA_IRQHandler           /*  29: SHA            */
#else
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
    .long   NOVIC_IRQ_Default_Handler    /*  default interrupt entry  */
#endif
    .size    __Vectors, . - __Vectors

    .text
    .long _start
    .align   2
_start:
    .text
    .align   2
    .globl   Reset_Handler
    .type    Reset_Handler, %function
Reset_Handler:
    /* set the priority cpu ahb */
    lrw     r0, AHB_BASE
    movi    r1, 0x1
    movi    r2, 0x2
    movi    r3, 0x3
    movi    r4, 0x4
    stw     r1, (r0, 0x0)
    stw     r2, (r0, 0xc)
    stw     r3, (r0, 0x4)
    stw     r4, (r0, 0x8)

    /* restore the eflash state when system reboot from deep sleep */
    lrw     r0, PMU_LP_CONTROL
    ldw     r1, (r0, 0)
    btsti   r1, 5
    bf      .LCPUINIT
    lrw     r0, EFLASH_CONTROL_BASE
    movi    r1, 0x35
    stw     r1, (r0, 0x24)
    movi    r1, 0x16
    stw     r1, (r0, 0x28)
    movi    r1, 0x35
    stw     r1, (r0, 0x2c)
    movi    r1, 0x1b9
    stw     r1, (r0, 0x30)
    movi    r1, 0x8b10
    stw     r1, (r0, 0x34)

.LCPUINIT:
#ifndef CONFIG_SYSTEM_SECURE
    lrw     r0, 0x80000000
    mtcr    r0, psr
#else
    lrw     r0, 0xe0000000
    mtcr    r0, psr
#endif

/* Initialize the normal stack pointer from the linker definition. */
    lrw     r0, g_top_irqstack
    mov     sp, r0

/*
 *  The ranges of copy from/to are specified by following symbols
 *    __etext: LMA of start of the section to copy from. Usually end of text
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
    lrw     r2, __data_start__
    lrw     r3, __data_end__

    subu    r3, r2
    cmpnei  r3, 0
    bf      .L_loop0_done

.L_loop0:
    ldw     r0, (r1, 0)
    stw     r0, (r2, 0)
    addi    r1, 4
    addi    r2, 4
    subi    r3, 4
    cmpnei  r3, 0
    bt      .L_loop0

.L_loop0_done:

/*
 *  The BSS section is specified by following symbols
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __bss_start__
    lrw     r2, __bss_end__

    movi    r0, 0

    subu    r2, r1
    cmpnei  r2, 0
    bf      .L_loop1_done

.L_loop1:
    stw     r0, (r1, 0)
    addi    r1, 4
    subi    r2, 4
    cmpnei  r2, 0
    bt      .L_loop1
.L_loop1_done:

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
#endif

    jbsr    main

    .size   Reset_Handler, . - Reset_Handler
__exit:
    br __exit

.section .bss

    .align  2
    .global g_intstackalloc
    .global g_intstackbase
    .global g_top_irqstack
g_intstackalloc:
g_intstackbase:
    .space  CONFIG_ARCH_INTERRUPTSTACK
g_top_irqstack:
