/*
 * Copyright (C) 2017 C-SKY Microsystems Co., All rights reserved.
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

#include <yoc_config.h>

#include <aos/cli.h>

void board_cli_init(utask_t *task)
{
    cli_service_init(task);

    cli_reg_cmd_help();
    cli_reg_cmd_ping();
    cli_reg_cmd_ifconfig();

#if defined(CONFIG_NTP)
    cli_reg_cmd_ntp();
#endif
    cli_reg_cmd_ps();
    cli_reg_cmd_free();
    cli_reg_cmd_factory();
    cli_reg_cmd_sysinfo();
    cli_reg_cmd_kvtool();
}
