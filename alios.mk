##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=alios
ConfigurationName      :=BuildSet
WorkspacePath          :=D:/alios_version_2.0/
ProjectPath            :=D:/alios_version_2.0/
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=yize
Date                   :=15/05/2019
CDKPath                :=D:/C-Sky/CDK
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elf-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="alios.txt"
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck802  -nostartfiles -Wl,--gc-sections -Wl,-zmax-page-size=1024 -T"$(ProjectPath)/board/cb2201/gcc_csky.ld"
IncludeCPath           :=$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)/csi_core/include" $(IncludeSwitch)"$(ProjectPath)/csi_driver/include" $(IncludeSwitch)"$(ProjectPath)/libs/include" $(IncludeSwitch)"$(ProjectPath)/csi_driver/ch2201/include" $(IncludeSwitch)"$(ProjectPath)/board/cb2201/include" $(IncludeSwitch)"$(ProjectPath)/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/core/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/arch/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/pwrmgmt" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/common" $(IncludeSwitch)"$(ProjectPath)/device" $(IncludeSwitch)"$(ProjectPath)/service" 
IncludeAPath           :=$(IncludeSwitch)"$(ProjectPath)" -Wa,$(IncludeSwitch)"$(ProjectPath)" $(IncludeSwitch)"$(ProjectPath)/include" -Wa,$(IncludeSwitch)"$(ProjectPath)/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/include" -Wa,$(IncludeSwitch)"$(ProjectPath)/csi_kernel/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/core/include" -Wa,$(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/core/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/arch/include" -Wa,$(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/arch/include" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/pwrmgmt" -Wa,$(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/pwrmgmt" $(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/common" -Wa,$(IncludeSwitch)"$(ProjectPath)/csi_kernel/rhino/common" 
Libs                   :=$(LibrarySwitch)m 
ArLibs                 := "m" 
LibPath                :=

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck802    $(UnPreprocessorSwitch)CONFIG_DISABLE_IRQ  -Os  -g3  -Wall -ffunction-sections -fdata-sections -Wsizeof-array-argument 
CFLAGS   := -mcpu=ck802    $(UnPreprocessorSwitch)CONFIG_DISABLE_IRQ  -Os  -g3  -Wall -ffunction-sections -fdata-sections -Wsizeof-array-argument 
ASFLAGS  := -mcpu=ck802    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/main_main$(ObjectSuffix) $(IntermediateDirectory)/device_my_pwm$(ObjectSuffix) $(IntermediateDirectory)/device_delay$(ObjectSuffix) $(IntermediateDirectory)/device_my_led$(ObjectSuffix) $(IntermediateDirectory)/device_my_device$(ObjectSuffix) $(IntermediateDirectory)/device_my_usart$(ObjectSuffix) $(IntermediateDirectory)/device_esp8266$(ObjectSuffix) $(IntermediateDirectory)/device_command$(ObjectSuffix) $(IntermediateDirectory)/device_my_dht11$(ObjectSuffix) $(IntermediateDirectory)/device_my_vol$(ObjectSuffix) \
	$(IntermediateDirectory)/device_my_oled$(ObjectSuffix) $(IntermediateDirectory)/device_my_oled_interface$(ObjectSuffix) $(IntermediateDirectory)/service_service$(ObjectSuffix) $(IntermediateDirectory)/cb2201_board_init$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_adc$(ObjectSuffix) $(IntermediateDirectory)/ch2201_dw_wdt$(ObjectSuffix) $(IntermediateDirectory)/ch2201_dw_spi$(ObjectSuffix) $(IntermediateDirectory)/ch2201_vectors$(ObjectSuffix) $(IntermediateDirectory)/ch2201_power_manager$(ObjectSuffix) $(IntermediateDirectory)/ch2201_dw_gpio$(ObjectSuffix) \
	$(IntermediateDirectory)/ch2201_lib$(ObjectSuffix) $(IntermediateDirectory)/ch2201_dw_usart$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_rtc$(ObjectSuffix) $(IntermediateDirectory)/ch2201_isr$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_trng$(ObjectSuffix) $(IntermediateDirectory)/ch2201_devices$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_aes$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_acmp$(ObjectSuffix) $(IntermediateDirectory)/ch2201_dw_dmac$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_crc_v1$(ObjectSuffix) \
	$(IntermediateDirectory)/ch2201_dw_timer$(ObjectSuffix) $(IntermediateDirectory)/ch2201_startup$(ObjectSuffix) $(IntermediateDirectory)/ch2201_pinmux$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_pwm$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_sha_v1$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_rsa$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_eflash$(ObjectSuffix) $(IntermediateDirectory)/ch2201_trap_c$(ObjectSuffix) $(IntermediateDirectory)/ch2201_ck_i2s$(ObjectSuffix) $(IntermediateDirectory)/ch2201_novic_irq_tbl$(ObjectSuffix) \
	$(IntermediateDirectory)/ch2201_sys_freq$(ObjectSuffix) $(IntermediateDirectory)/ch2201_lpm_arch_reg_save$(ObjectSuffix) $(IntermediateDirectory)/ch2201_system$(ObjectSuffix) $(IntermediateDirectory)/ch2201_dw_iic$(ObjectSuffix) $(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) \
	$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) $(IntermediateDirectory)/common_k_trace$(ObjectSuffix) $(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) $(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) \
	$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) $(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) $(IntermediateDirectory)/driver_systick$(ObjectSuffix) $(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) $(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) $(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) $(IntermediateDirectory)/core_k_task$(ObjectSuffix) $(IntermediateDirectory)/core_k_event$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) $(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) \
	$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) $(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) $(IntermediateDirectory)/core_k_timer$(ObjectSuffix) $(IntermediateDirectory)/core_k_idle$(ObjectSuffix) $(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) $(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) $(IntermediateDirectory)/core_k_tick$(ObjectSuffix) $(IntermediateDirectory)/core_k_sem$(ObjectSuffix) $(IntermediateDirectory)/core_k_obj$(ObjectSuffix) \
	$(IntermediateDirectory)/core_k_time$(ObjectSuffix) $(IntermediateDirectory)/core_k_sched$(ObjectSuffix) $(IntermediateDirectory)/core_k_stats$(ObjectSuffix) $(IntermediateDirectory)/core_k_pend$(ObjectSuffix) $(IntermediateDirectory)/core_k_queue$(ObjectSuffix) $(IntermediateDirectory)/core_k_mm$(ObjectSuffix) $(IntermediateDirectory)/core_k_err$(ObjectSuffix) $(IntermediateDirectory)/core_k_sys$(ObjectSuffix) $(IntermediateDirectory)/csky_port_s$(ObjectSuffix) $(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix) \
	$(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix) $(IntermediateDirectory)/csky_port_c$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PostBuild MakeIntermediateDirs
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@echo "" > $(IntermediateDirectory)/.d
	@touch  $(ObjectsFileList)
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo $(Objects1) >> $(ObjectsFileList)
	@echo linking...
	@$(LinkerName) $(OutputSwitch)"$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" $(LinkerNameoption) @$(ObjectsFileList)  $(LibPath) $(Libs)  -Wl,--whole-archive  -Wl,--no-whole-archive $(LinkOptions)
	@echo generating hex file...
	@$(OBJCOPY) $(ObjcopySwitch) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)"  "$(ProjectPath)/Obj/$(OutputFile)$(IHexSuffix)" 
	@echo size of target:
	@$(SIZE) "$(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	@echo -n "checksum value of target:  "
	@$(CHECKSUM) "$(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)" 
	
MakeIntermediateDirs:
	@test -d Obj || $(MakeDirCommand) Obj

	@test -d Lst || $(MakeDirCommand) Lst

$(IntermediateDirectory)/.d:
	@test -d Obj || $(MakeDirCommand) Obj
	@test -d Lst || $(MakeDirCommand) Lst


PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main_main$(ObjectSuffix): D:/alios_version_2.0/main/main.c  
	@echo compiling main.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/main/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main_main$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/main_main$(ObjectSuffix) -MF$(IntermediateDirectory)/main_main$(DependSuffix) -MM "D:/alios_version_2.0/main/main.c"

Lst/main_main$(PreprocessSuffix): D:/alios_version_2.0/main/main.c
	@echo generating preprocess file of main.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/main_main$(PreprocessSuffix) "D:/alios_version_2.0/main/main.c"

$(IntermediateDirectory)/device_my_pwm$(ObjectSuffix): D:/alios_version_2.0/device/my_pwm.c  
	@echo compiling my_pwm.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_pwm.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_pwm$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_pwm$(DependSuffix) -MM "D:/alios_version_2.0/device/my_pwm.c"

Lst/device_my_pwm$(PreprocessSuffix): D:/alios_version_2.0/device/my_pwm.c
	@echo generating preprocess file of my_pwm.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_pwm$(PreprocessSuffix) "D:/alios_version_2.0/device/my_pwm.c"

$(IntermediateDirectory)/device_delay$(ObjectSuffix): D:/alios_version_2.0/device/delay.c  
	@echo compiling delay.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/delay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_delay$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_delay$(ObjectSuffix) -MF$(IntermediateDirectory)/device_delay$(DependSuffix) -MM "D:/alios_version_2.0/device/delay.c"

Lst/device_delay$(PreprocessSuffix): D:/alios_version_2.0/device/delay.c
	@echo generating preprocess file of delay.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_delay$(PreprocessSuffix) "D:/alios_version_2.0/device/delay.c"

$(IntermediateDirectory)/device_my_led$(ObjectSuffix): D:/alios_version_2.0/device/my_led.c  
	@echo compiling my_led.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_led.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_led$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_led$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_led$(DependSuffix) -MM "D:/alios_version_2.0/device/my_led.c"

Lst/device_my_led$(PreprocessSuffix): D:/alios_version_2.0/device/my_led.c
	@echo generating preprocess file of my_led.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_led$(PreprocessSuffix) "D:/alios_version_2.0/device/my_led.c"

$(IntermediateDirectory)/device_my_device$(ObjectSuffix): D:/alios_version_2.0/device/my_device.c  
	@echo compiling my_device.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_device.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_device$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_device$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_device$(DependSuffix) -MM "D:/alios_version_2.0/device/my_device.c"

Lst/device_my_device$(PreprocessSuffix): D:/alios_version_2.0/device/my_device.c
	@echo generating preprocess file of my_device.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_device$(PreprocessSuffix) "D:/alios_version_2.0/device/my_device.c"

$(IntermediateDirectory)/device_my_usart$(ObjectSuffix): D:/alios_version_2.0/device/my_usart.c  
	@echo compiling my_usart.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_usart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_usart$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_usart$(DependSuffix) -MM "D:/alios_version_2.0/device/my_usart.c"

Lst/device_my_usart$(PreprocessSuffix): D:/alios_version_2.0/device/my_usart.c
	@echo generating preprocess file of my_usart.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_usart$(PreprocessSuffix) "D:/alios_version_2.0/device/my_usart.c"

$(IntermediateDirectory)/device_esp8266$(ObjectSuffix): D:/alios_version_2.0/device/esp8266.c  
	@echo compiling esp8266.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/esp8266.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_esp8266$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_esp8266$(ObjectSuffix) -MF$(IntermediateDirectory)/device_esp8266$(DependSuffix) -MM "D:/alios_version_2.0/device/esp8266.c"

Lst/device_esp8266$(PreprocessSuffix): D:/alios_version_2.0/device/esp8266.c
	@echo generating preprocess file of esp8266.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_esp8266$(PreprocessSuffix) "D:/alios_version_2.0/device/esp8266.c"

$(IntermediateDirectory)/device_command$(ObjectSuffix): D:/alios_version_2.0/device/command.c  
	@echo compiling command.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/command.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_command$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_command$(ObjectSuffix) -MF$(IntermediateDirectory)/device_command$(DependSuffix) -MM "D:/alios_version_2.0/device/command.c"

Lst/device_command$(PreprocessSuffix): D:/alios_version_2.0/device/command.c
	@echo generating preprocess file of command.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_command$(PreprocessSuffix) "D:/alios_version_2.0/device/command.c"

$(IntermediateDirectory)/device_my_dht11$(ObjectSuffix): D:/alios_version_2.0/device/my_dht11.c  
	@echo compiling my_dht11.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_dht11.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_dht11$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_dht11$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_dht11$(DependSuffix) -MM "D:/alios_version_2.0/device/my_dht11.c"

Lst/device_my_dht11$(PreprocessSuffix): D:/alios_version_2.0/device/my_dht11.c
	@echo generating preprocess file of my_dht11.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_dht11$(PreprocessSuffix) "D:/alios_version_2.0/device/my_dht11.c"

$(IntermediateDirectory)/device_my_vol$(ObjectSuffix): D:/alios_version_2.0/device/my_vol.c  
	@echo compiling my_vol.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_vol.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_vol$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_vol$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_vol$(DependSuffix) -MM "D:/alios_version_2.0/device/my_vol.c"

Lst/device_my_vol$(PreprocessSuffix): D:/alios_version_2.0/device/my_vol.c
	@echo generating preprocess file of my_vol.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_vol$(PreprocessSuffix) "D:/alios_version_2.0/device/my_vol.c"

$(IntermediateDirectory)/device_my_oled$(ObjectSuffix): D:/alios_version_2.0/device/my_oled.c  
	@echo compiling my_oled.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_oled.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_oled$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_oled$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_oled$(DependSuffix) -MM "D:/alios_version_2.0/device/my_oled.c"

Lst/device_my_oled$(PreprocessSuffix): D:/alios_version_2.0/device/my_oled.c
	@echo generating preprocess file of my_oled.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_oled$(PreprocessSuffix) "D:/alios_version_2.0/device/my_oled.c"

$(IntermediateDirectory)/device_my_oled_interface$(ObjectSuffix): D:/alios_version_2.0/device/my_oled_interface.c  
	@echo compiling my_oled_interface.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/device/my_oled_interface.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_my_oled_interface$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/device_my_oled_interface$(ObjectSuffix) -MF$(IntermediateDirectory)/device_my_oled_interface$(DependSuffix) -MM "D:/alios_version_2.0/device/my_oled_interface.c"

Lst/device_my_oled_interface$(PreprocessSuffix): D:/alios_version_2.0/device/my_oled_interface.c
	@echo generating preprocess file of my_oled_interface.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_my_oled_interface$(PreprocessSuffix) "D:/alios_version_2.0/device/my_oled_interface.c"

$(IntermediateDirectory)/service_service$(ObjectSuffix): D:/alios_version_2.0/service/service.c  
	@echo compiling service.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/service/service.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/service_service$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/service_service$(ObjectSuffix) -MF$(IntermediateDirectory)/service_service$(DependSuffix) -MM "D:/alios_version_2.0/service/service.c"

Lst/service_service$(PreprocessSuffix): D:/alios_version_2.0/service/service.c
	@echo generating preprocess file of service.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/service_service$(PreprocessSuffix) "D:/alios_version_2.0/service/service.c"

$(IntermediateDirectory)/cb2201_board_init$(ObjectSuffix): D:/alios_version_2.0/board/cb2201/board_init.c  
	@echo compiling board_init.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/board/cb2201/board_init.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cb2201_board_init$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/cb2201_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/cb2201_board_init$(DependSuffix) -MM "D:/alios_version_2.0/board/cb2201/board_init.c"

Lst/cb2201_board_init$(PreprocessSuffix): D:/alios_version_2.0/board/cb2201/board_init.c
	@echo generating preprocess file of board_init.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/cb2201_board_init$(PreprocessSuffix) "D:/alios_version_2.0/board/cb2201/board_init.c"

$(IntermediateDirectory)/ch2201_ck_adc$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_adc.c  
	@echo compiling ck_adc.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_adc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_adc$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_adc$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_adc.c"

Lst/ch2201_ck_adc$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_adc.c
	@echo generating preprocess file of ck_adc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_adc$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_adc.c"

$(IntermediateDirectory)/ch2201_dw_wdt$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_wdt.c  
	@echo compiling dw_wdt.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/dw_wdt.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_dw_wdt$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_dw_wdt$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_dw_wdt$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/dw_wdt.c"

Lst/ch2201_dw_wdt$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_wdt.c
	@echo generating preprocess file of dw_wdt.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_dw_wdt$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/dw_wdt.c"

$(IntermediateDirectory)/ch2201_dw_spi$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_spi.c  
	@echo compiling dw_spi.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/dw_spi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_dw_spi$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_dw_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_dw_spi$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/dw_spi.c"

Lst/ch2201_dw_spi$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_spi.c
	@echo generating preprocess file of dw_spi.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_dw_spi$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/dw_spi.c"

$(IntermediateDirectory)/ch2201_vectors$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/vectors.S  
	@echo assembling vectors.S...
	@$(AS) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/vectors.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_vectors$(ObjectSuffix) $(IncludeAPath)
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_vectors$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/vectors.S"

Lst/ch2201_vectors$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/vectors.S
	@echo generating preprocess file of vectors.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_vectors$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/vectors.S"

$(IntermediateDirectory)/ch2201_power_manager$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/power_manager.c  
	@echo compiling power_manager.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/power_manager.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_power_manager$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_power_manager$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_power_manager$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/power_manager.c"

Lst/ch2201_power_manager$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/power_manager.c
	@echo generating preprocess file of power_manager.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_power_manager$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/power_manager.c"

$(IntermediateDirectory)/ch2201_dw_gpio$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_gpio.c  
	@echo compiling dw_gpio.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/dw_gpio.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_dw_gpio$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_dw_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_dw_gpio$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/dw_gpio.c"

Lst/ch2201_dw_gpio$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_gpio.c
	@echo generating preprocess file of dw_gpio.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_dw_gpio$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/dw_gpio.c"

$(IntermediateDirectory)/ch2201_lib$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/lib.c  
	@echo compiling lib.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/lib.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_lib$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_lib$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/lib.c"

Lst/ch2201_lib$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/lib.c
	@echo generating preprocess file of lib.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_lib$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/lib.c"

$(IntermediateDirectory)/ch2201_dw_usart$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_usart.c  
	@echo compiling dw_usart.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/dw_usart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_dw_usart$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_dw_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_dw_usart$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/dw_usart.c"

Lst/ch2201_dw_usart$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_usart.c
	@echo generating preprocess file of dw_usart.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_dw_usart$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/dw_usart.c"

$(IntermediateDirectory)/ch2201_ck_rtc$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_rtc.c  
	@echo compiling ck_rtc.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_rtc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_rtc$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_rtc$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_rtc.c"

Lst/ch2201_ck_rtc$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_rtc.c
	@echo generating preprocess file of ck_rtc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_rtc$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_rtc.c"

$(IntermediateDirectory)/ch2201_isr$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/isr.c  
	@echo compiling isr.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/isr.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_isr$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_isr$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/isr.c"

Lst/ch2201_isr$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/isr.c
	@echo generating preprocess file of isr.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_isr$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/isr.c"

$(IntermediateDirectory)/ch2201_ck_trng$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_trng.c  
	@echo compiling ck_trng.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_trng.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_trng$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_trng$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_trng$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_trng.c"

Lst/ch2201_ck_trng$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_trng.c
	@echo generating preprocess file of ck_trng.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_trng$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_trng.c"

$(IntermediateDirectory)/ch2201_devices$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/devices.c  
	@echo compiling devices.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/devices.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_devices$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_devices$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_devices$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/devices.c"

Lst/ch2201_devices$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/devices.c
	@echo generating preprocess file of devices.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_devices$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/devices.c"

$(IntermediateDirectory)/ch2201_ck_aes$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_aes.c  
	@echo compiling ck_aes.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_aes.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_aes$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_aes$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_aes$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_aes.c"

Lst/ch2201_ck_aes$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_aes.c
	@echo generating preprocess file of ck_aes.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_aes$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_aes.c"

$(IntermediateDirectory)/ch2201_ck_acmp$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_acmp.c  
	@echo compiling ck_acmp.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_acmp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_acmp$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_acmp$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_acmp$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_acmp.c"

Lst/ch2201_ck_acmp$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_acmp.c
	@echo generating preprocess file of ck_acmp.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_acmp$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_acmp.c"

$(IntermediateDirectory)/ch2201_dw_dmac$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_dmac.c  
	@echo compiling dw_dmac.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/dw_dmac.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_dw_dmac$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_dw_dmac$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_dw_dmac$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/dw_dmac.c"

Lst/ch2201_dw_dmac$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_dmac.c
	@echo generating preprocess file of dw_dmac.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_dw_dmac$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/dw_dmac.c"

$(IntermediateDirectory)/ch2201_ck_crc_v1$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_crc_v1.c  
	@echo compiling ck_crc_v1.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_crc_v1.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_crc_v1$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_crc_v1$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_crc_v1$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_crc_v1.c"

Lst/ch2201_ck_crc_v1$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_crc_v1.c
	@echo generating preprocess file of ck_crc_v1.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_crc_v1$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_crc_v1.c"

$(IntermediateDirectory)/ch2201_dw_timer$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_timer.c  
	@echo compiling dw_timer.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/dw_timer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_dw_timer$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_dw_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_dw_timer$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/dw_timer.c"

Lst/ch2201_dw_timer$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_timer.c
	@echo generating preprocess file of dw_timer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_dw_timer$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/dw_timer.c"

$(IntermediateDirectory)/ch2201_startup$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/startup.S  
	@echo assembling startup.S...
	@$(AS) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/startup.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_startup$(ObjectSuffix) $(IncludeAPath)
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_startup$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/startup.S"

Lst/ch2201_startup$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/startup.S
	@echo generating preprocess file of startup.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_startup$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/startup.S"

$(IntermediateDirectory)/ch2201_pinmux$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/pinmux.c  
	@echo compiling pinmux.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/pinmux.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_pinmux$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_pinmux$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_pinmux$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/pinmux.c"

Lst/ch2201_pinmux$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/pinmux.c
	@echo generating preprocess file of pinmux.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_pinmux$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/pinmux.c"

$(IntermediateDirectory)/ch2201_ck_pwm$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_pwm.c  
	@echo compiling ck_pwm.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_pwm.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_pwm$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_pwm$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_pwm.c"

Lst/ch2201_ck_pwm$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_pwm.c
	@echo generating preprocess file of ck_pwm.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_pwm$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_pwm.c"

$(IntermediateDirectory)/ch2201_ck_sha_v1$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_sha_v1.c  
	@echo compiling ck_sha_v1.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_sha_v1.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_sha_v1$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_sha_v1$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_sha_v1$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_sha_v1.c"

Lst/ch2201_ck_sha_v1$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_sha_v1.c
	@echo generating preprocess file of ck_sha_v1.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_sha_v1$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_sha_v1.c"

$(IntermediateDirectory)/ch2201_ck_rsa$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_rsa.c  
	@echo compiling ck_rsa.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_rsa.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_rsa$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_rsa$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_rsa$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_rsa.c"

Lst/ch2201_ck_rsa$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_rsa.c
	@echo generating preprocess file of ck_rsa.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_rsa$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_rsa.c"

$(IntermediateDirectory)/ch2201_ck_eflash$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_eflash.c  
	@echo compiling ck_eflash.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_eflash.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_eflash$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_eflash$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_eflash$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_eflash.c"

Lst/ch2201_ck_eflash$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_eflash.c
	@echo generating preprocess file of ck_eflash.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_eflash$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_eflash.c"

$(IntermediateDirectory)/ch2201_trap_c$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/trap_c.c  
	@echo compiling trap_c.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/trap_c.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_trap_c$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_trap_c$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/trap_c.c"

Lst/ch2201_trap_c$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/trap_c.c
	@echo generating preprocess file of trap_c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_trap_c$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/trap_c.c"

$(IntermediateDirectory)/ch2201_ck_i2s$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_i2s.c  
	@echo compiling ck_i2s.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/ck_i2s.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_ck_i2s$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_ck_i2s$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_ck_i2s$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/ck_i2s.c"

Lst/ch2201_ck_i2s$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/ck_i2s.c
	@echo generating preprocess file of ck_i2s.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_ck_i2s$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/ck_i2s.c"

$(IntermediateDirectory)/ch2201_novic_irq_tbl$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/novic_irq_tbl.c  
	@echo compiling novic_irq_tbl.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/novic_irq_tbl.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_novic_irq_tbl$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_novic_irq_tbl$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_novic_irq_tbl$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/novic_irq_tbl.c"

Lst/ch2201_novic_irq_tbl$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/novic_irq_tbl.c
	@echo generating preprocess file of novic_irq_tbl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_novic_irq_tbl$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/novic_irq_tbl.c"

$(IntermediateDirectory)/ch2201_sys_freq$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/sys_freq.c  
	@echo compiling sys_freq.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/sys_freq.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_sys_freq$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_sys_freq$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_sys_freq$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/sys_freq.c"

Lst/ch2201_sys_freq$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/sys_freq.c
	@echo generating preprocess file of sys_freq.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_sys_freq$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/sys_freq.c"

$(IntermediateDirectory)/ch2201_lpm_arch_reg_save$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/lpm_arch_reg_save.S  
	@echo assembling lpm_arch_reg_save.S...
	@$(AS) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/lpm_arch_reg_save.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_lpm_arch_reg_save$(ObjectSuffix) $(IncludeAPath)
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_lpm_arch_reg_save$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_lpm_arch_reg_save$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/lpm_arch_reg_save.S"

Lst/ch2201_lpm_arch_reg_save$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/lpm_arch_reg_save.S
	@echo generating preprocess file of lpm_arch_reg_save.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_lpm_arch_reg_save$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/lpm_arch_reg_save.S"

$(IntermediateDirectory)/ch2201_system$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/system.c  
	@echo compiling system.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/system.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_system$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_system$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_system$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/system.c"

Lst/ch2201_system$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/system.c
	@echo generating preprocess file of system.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_system$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/system.c"

$(IntermediateDirectory)/ch2201_dw_iic$(ObjectSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_iic.c  
	@echo compiling dw_iic.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_driver/ch2201/dw_iic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ch2201_dw_iic$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/ch2201_dw_iic$(ObjectSuffix) -MF$(IntermediateDirectory)/ch2201_dw_iic$(DependSuffix) -MM "D:/alios_version_2.0/csi_driver/ch2201/dw_iic.c"

Lst/ch2201_dw_iic$(PreprocessSuffix): D:/alios_version_2.0/csi_driver/ch2201/dw_iic.c
	@echo generating preprocess file of dw_iic.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ch2201_dw_iic$(PreprocessSuffix) "D:/alios_version_2.0/csi_driver/ch2201/dw_iic.c"

$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix): D:/alios_version_2.0/libs/libc/minilibc_port.c  
	@echo compiling minilibc_port.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/libc/minilibc_port.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_minilibc_port$(DependSuffix) -MM "D:/alios_version_2.0/libs/libc/minilibc_port.c"

Lst/libc_minilibc_port$(PreprocessSuffix): D:/alios_version_2.0/libs/libc/minilibc_port.c
	@echo generating preprocess file of minilibc_port.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_minilibc_port$(PreprocessSuffix) "D:/alios_version_2.0/libs/libc/minilibc_port.c"

$(IntermediateDirectory)/libc_malloc$(ObjectSuffix): D:/alios_version_2.0/libs/libc/malloc.c  
	@echo compiling malloc.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/libc/malloc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_malloc$(DependSuffix) -MM "D:/alios_version_2.0/libs/libc/malloc.c"

Lst/libc_malloc$(PreprocessSuffix): D:/alios_version_2.0/libs/libc/malloc.c
	@echo generating preprocess file of malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_malloc$(PreprocessSuffix) "D:/alios_version_2.0/libs/libc/malloc.c"

$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix): D:/alios_version_2.0/libs/mm/mm_addfreechunk.c  
	@echo compiling mm_addfreechunk.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/mm_addfreechunk.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_addfreechunk$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/mm_addfreechunk.c"

Lst/mm_mm_addfreechunk$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/mm_addfreechunk.c
	@echo generating preprocess file of mm_addfreechunk.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_addfreechunk$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/mm_addfreechunk.c"

$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix): D:/alios_version_2.0/libs/mm/lib_mallinfo.c  
	@echo compiling lib_mallinfo.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/lib_mallinfo.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_lib_mallinfo$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/lib_mallinfo.c"

Lst/mm_lib_mallinfo$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/lib_mallinfo.c
	@echo generating preprocess file of lib_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_lib_mallinfo$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/lib_mallinfo.c"

$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix): D:/alios_version_2.0/libs/mm/dq_addlast.c  
	@echo compiling dq_addlast.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/dq_addlast.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_addlast$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/dq_addlast.c"

Lst/mm_dq_addlast$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/dq_addlast.c
	@echo generating preprocess file of dq_addlast.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_addlast$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/dq_addlast.c"

$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix): D:/alios_version_2.0/libs/mm/mm_mallinfo.c  
	@echo compiling mm_mallinfo.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/mm_mallinfo.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_mallinfo$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/mm_mallinfo.c"

Lst/mm_mm_mallinfo$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/mm_mallinfo.c
	@echo generating preprocess file of mm_mallinfo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_mallinfo$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/mm_mallinfo.c"

$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix): D:/alios_version_2.0/libs/mm/dq_rem.c  
	@echo compiling dq_rem.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/dq_rem.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_rem$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/dq_rem.c"

Lst/mm_dq_rem$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/dq_rem.c
	@echo generating preprocess file of dq_rem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_rem$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/dq_rem.c"

$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix): D:/alios_version_2.0/libs/mm/mm_free.c  
	@echo compiling mm_free.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/mm_free.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_free$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/mm_free.c"

Lst/mm_mm_free$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/mm_free.c
	@echo generating preprocess file of mm_free.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_free$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/mm_free.c"

$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix): D:/alios_version_2.0/libs/mm/mm_malloc.c  
	@echo compiling mm_malloc.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/mm_malloc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_malloc$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/mm_malloc.c"

Lst/mm_mm_malloc$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/mm_malloc.c
	@echo generating preprocess file of mm_malloc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_malloc$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/mm_malloc.c"

$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix): D:/alios_version_2.0/libs/mm/mm_leak.c  
	@echo compiling mm_leak.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/mm_leak.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_leak$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/mm_leak.c"

Lst/mm_mm_leak$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/mm_leak.c
	@echo generating preprocess file of mm_leak.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_leak$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/mm_leak.c"

$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix): D:/alios_version_2.0/libs/mm/mm_size2ndx.c  
	@echo compiling mm_size2ndx.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/mm_size2ndx.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_size2ndx$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/mm_size2ndx.c"

Lst/mm_mm_size2ndx$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/mm_size2ndx.c
	@echo generating preprocess file of mm_size2ndx.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_size2ndx$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/mm_size2ndx.c"

$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix): D:/alios_version_2.0/libs/mm/mm_initialize.c  
	@echo compiling mm_initialize.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/libs/mm/mm_initialize.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_initialize$(DependSuffix) -MM "D:/alios_version_2.0/libs/mm/mm_initialize.c"

Lst/mm_mm_initialize$(PreprocessSuffix): D:/alios_version_2.0/libs/mm/mm_initialize.c
	@echo generating preprocess file of mm_initialize.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_initialize$(PreprocessSuffix) "D:/alios_version_2.0/libs/mm/mm_initialize.c"

$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/adapter/csi_rhino.c  
	@echo compiling csi_rhino.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/adapter/csi_rhino.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/adapter_csi_rhino$(ObjectSuffix) -MF$(IntermediateDirectory)/adapter_csi_rhino$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/adapter/csi_rhino.c"

Lst/adapter_csi_rhino$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/adapter/csi_rhino.c
	@echo generating preprocess file of csi_rhino.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/adapter_csi_rhino$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/adapter/csi_rhino.c"

$(IntermediateDirectory)/common_k_trace$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_trace.c  
	@echo compiling k_trace.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/common/k_trace.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/common_k_trace$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/common_k_trace$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_trace$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/common/k_trace.c"

Lst/common_k_trace$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_trace.c
	@echo generating preprocess file of k_trace.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_trace$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/common/k_trace.c"

$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_ffs.c  
	@echo compiling k_ffs.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/common/k_ffs.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/common_k_ffs$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_ffs$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/common/k_ffs.c"

Lst/common_k_ffs$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_ffs.c
	@echo generating preprocess file of k_ffs.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_ffs$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/common/k_ffs.c"

$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_atomic.c  
	@echo compiling k_atomic.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/common/k_atomic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/common_k_atomic$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_atomic$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/common/k_atomic.c"

Lst/common_k_atomic$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_atomic.c
	@echo generating preprocess file of k_atomic.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_atomic$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/common/k_atomic.c"

$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_fifo.c  
	@echo compiling k_fifo.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/common/k_fifo.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/common_k_fifo$(ObjectSuffix) -MF$(IntermediateDirectory)/common_k_fifo$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/common/k_fifo.c"

Lst/common_k_fifo$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/common/k_fifo.c
	@echo generating preprocess file of k_fifo.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/common_k_fifo$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/common/k_fifo.c"

$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/hook_weak.c  
	@echo compiling hook_weak.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/driver/hook_weak.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/driver_hook_weak$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_hook_weak$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/driver/hook_weak.c"

Lst/driver_hook_weak$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/hook_weak.c
	@echo generating preprocess file of hook_weak.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_hook_weak$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/driver/hook_weak.c"

$(IntermediateDirectory)/driver_systick$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/systick.c  
	@echo compiling systick.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/driver/systick.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/driver_systick$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/driver_systick$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_systick$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/driver/systick.c"

Lst/driver_systick$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/systick.c
	@echo generating preprocess file of systick.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_systick$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/driver/systick.c"

$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/yoc_impl.c  
	@echo compiling yoc_impl.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/driver/yoc_impl.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/driver_yoc_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_yoc_impl$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/driver/yoc_impl.c"

Lst/driver_yoc_impl$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/yoc_impl.c
	@echo generating preprocess file of yoc_impl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_yoc_impl$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/driver/yoc_impl.c"

$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/hook_impl.c  
	@echo compiling hook_impl.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/driver/hook_impl.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/driver_hook_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_hook_impl$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/driver/hook_impl.c"

Lst/driver_hook_impl$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/driver/hook_impl.c
	@echo generating preprocess file of hook_impl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_hook_impl$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/driver/hook_impl.c"

$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mutex.c  
	@echo compiling k_mutex.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mutex.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_mutex$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mutex$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_mutex.c"

Lst/core_k_mutex$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mutex.c
	@echo generating preprocess file of k_mutex.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mutex$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mutex.c"

$(IntermediateDirectory)/core_k_task$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_task.c  
	@echo compiling k_task.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_task.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_task$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_task$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_task$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_task.c"

Lst/core_k_task$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_task.c
	@echo generating preprocess file of k_task.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_task$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_task.c"

$(IntermediateDirectory)/core_k_event$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_event.c  
	@echo compiling k_event.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_event.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_event$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_event$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_event$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_event.c"

Lst/core_k_event$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_event.c
	@echo generating preprocess file of k_event.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_event$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_event.c"

$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_debug.c  
	@echo compiling k_mm_debug.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_debug.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_mm_debug$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm_debug$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_debug.c"

Lst/core_k_mm_debug$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_debug.c
	@echo generating preprocess file of k_mm_debug.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm_debug$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_debug.c"

$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_task_sem.c  
	@echo compiling k_task_sem.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_task_sem.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_task_sem$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_task_sem$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_task_sem.c"

Lst/core_k_task_sem$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_task_sem.c
	@echo generating preprocess file of k_task_sem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_task_sem$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_task_sem.c"

$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_workqueue.c  
	@echo compiling k_workqueue.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_workqueue.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_workqueue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_workqueue$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_workqueue.c"

Lst/core_k_workqueue$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_workqueue.c
	@echo generating preprocess file of k_workqueue.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_workqueue$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_workqueue.c"

$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_dyn_mem_proc.c  
	@echo compiling k_dyn_mem_proc.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_dyn_mem_proc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_dyn_mem_proc$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_dyn_mem_proc$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_dyn_mem_proc.c"

Lst/core_k_dyn_mem_proc$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_dyn_mem_proc.c
	@echo generating preprocess file of k_dyn_mem_proc.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_dyn_mem_proc$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_dyn_mem_proc.c"

$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_blk.c  
	@echo compiling k_mm_blk.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_blk.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_mm_blk$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm_blk$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_blk.c"

Lst/core_k_mm_blk$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_blk.c
	@echo generating preprocess file of k_mm_blk.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm_blk$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm_blk.c"

$(IntermediateDirectory)/core_k_timer$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_timer.c  
	@echo compiling k_timer.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_timer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_timer$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_timer$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_timer.c"

Lst/core_k_timer$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_timer.c
	@echo generating preprocess file of k_timer.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_timer$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_timer.c"

$(IntermediateDirectory)/core_k_idle$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_idle.c  
	@echo compiling k_idle.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_idle.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_idle$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_idle$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_idle$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_idle.c"

Lst/core_k_idle$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_idle.c
	@echo generating preprocess file of k_idle.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_idle$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_idle.c"

$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_buf_queue.c  
	@echo compiling k_buf_queue.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_buf_queue.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_buf_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_buf_queue$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_buf_queue.c"

Lst/core_k_buf_queue$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_buf_queue.c
	@echo generating preprocess file of k_buf_queue.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_buf_queue$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_buf_queue.c"

$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_ringbuf.c  
	@echo compiling k_ringbuf.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_ringbuf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_ringbuf$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_ringbuf$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_ringbuf.c"

Lst/core_k_ringbuf$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_ringbuf.c
	@echo generating preprocess file of k_ringbuf.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_ringbuf$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_ringbuf.c"

$(IntermediateDirectory)/core_k_tick$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_tick.c  
	@echo compiling k_tick.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_tick.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_tick$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_tick$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_tick$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_tick.c"

Lst/core_k_tick$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_tick.c
	@echo generating preprocess file of k_tick.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_tick$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_tick.c"

$(IntermediateDirectory)/core_k_sem$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_sem.c  
	@echo compiling k_sem.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_sem.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sem$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_sem$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sem$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_sem.c"

Lst/core_k_sem$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_sem.c
	@echo generating preprocess file of k_sem.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sem$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_sem.c"

$(IntermediateDirectory)/core_k_obj$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_obj.c  
	@echo compiling k_obj.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_obj.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_obj$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_obj$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_obj$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_obj.c"

Lst/core_k_obj$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_obj.c
	@echo generating preprocess file of k_obj.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_obj$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_obj.c"

$(IntermediateDirectory)/core_k_time$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_time.c  
	@echo compiling k_time.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_time.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_time$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_time$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_time$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_time.c"

Lst/core_k_time$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_time.c
	@echo generating preprocess file of k_time.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_time$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_time.c"

$(IntermediateDirectory)/core_k_sched$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_sched.c  
	@echo compiling k_sched.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_sched.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sched$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_sched$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sched$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_sched.c"

Lst/core_k_sched$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_sched.c
	@echo generating preprocess file of k_sched.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sched$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_sched.c"

$(IntermediateDirectory)/core_k_stats$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_stats.c  
	@echo compiling k_stats.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_stats.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_stats$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_stats$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_stats$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_stats.c"

Lst/core_k_stats$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_stats.c
	@echo generating preprocess file of k_stats.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_stats$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_stats.c"

$(IntermediateDirectory)/core_k_pend$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_pend.c  
	@echo compiling k_pend.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_pend.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_pend$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_pend$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_pend$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_pend.c"

Lst/core_k_pend$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_pend.c
	@echo generating preprocess file of k_pend.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_pend$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_pend.c"

$(IntermediateDirectory)/core_k_queue$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_queue.c  
	@echo compiling k_queue.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_queue.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_queue$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_queue$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_queue.c"

Lst/core_k_queue$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_queue.c
	@echo generating preprocess file of k_queue.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_queue$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_queue.c"

$(IntermediateDirectory)/core_k_mm$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mm.c  
	@echo compiling k_mm.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_mm$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_mm$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_mm$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm.c"

Lst/core_k_mm$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_mm.c
	@echo generating preprocess file of k_mm.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_mm$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_mm.c"

$(IntermediateDirectory)/core_k_err$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_err.c  
	@echo compiling k_err.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_err.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_err$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_err$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_err$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_err.c"

Lst/core_k_err$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_err.c
	@echo generating preprocess file of k_err.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_err$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_err.c"

$(IntermediateDirectory)/core_k_sys$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_sys.c  
	@echo compiling k_sys.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/core/k_sys.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/core_k_sys$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/core_k_sys$(ObjectSuffix) -MF$(IntermediateDirectory)/core_k_sys$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/core/k_sys.c"

Lst/core_k_sys$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/core/k_sys.c
	@echo generating preprocess file of k_sys.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/core_k_sys$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/core/k_sys.c"

$(IntermediateDirectory)/csky_port_s$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_s.S  
	@echo assembling port_s.S...
	@$(AS) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_s.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/csky_port_s$(ObjectSuffix) $(IncludeAPath)
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/csky_port_s$(ObjectSuffix) -MF$(IntermediateDirectory)/csky_port_s$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_s.S"

Lst/csky_port_s$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_s.S
	@echo generating preprocess file of port_s.S...
	@$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/csky_port_s$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_s.S"

$(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/cpu_impl.c  
	@echo compiling cpu_impl.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/cpu_impl.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/csky_cpu_impl$(ObjectSuffix) -MF$(IntermediateDirectory)/csky_cpu_impl$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/cpu_impl.c"

Lst/csky_cpu_impl$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/cpu_impl.c
	@echo generating preprocess file of cpu_impl.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/csky_cpu_impl$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/cpu_impl.c"

$(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/csky_sched.c  
	@echo compiling csky_sched.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/csky_sched.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/csky_csky_sched$(ObjectSuffix) -MF$(IntermediateDirectory)/csky_csky_sched$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/csky_sched.c"

Lst/csky_csky_sched$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/csky_sched.c
	@echo generating preprocess file of csky_sched.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/csky_csky_sched$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/csky_sched.c"

$(IntermediateDirectory)/csky_port_c$(ObjectSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_c.c  
	@echo compiling port_c.c...
	@$(CC) $(SourceSwitch) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_c.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/csky_port_c$(ObjectSuffix) $(IncludeCPath)
	@$(CC) $(CFLAGS) $(IncludeCPath) -MG -MP -MT$(IntermediateDirectory)/csky_port_c$(ObjectSuffix) -MF$(IntermediateDirectory)/csky_port_c$(DependSuffix) -MM "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_c.c"

Lst/csky_port_c$(PreprocessSuffix): D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_c.c
	@echo generating preprocess file of port_c.c...
	@$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/csky_port_c$(PreprocessSuffix) "D:/alios_version_2.0/csi_kernel/rhino/arch/csky/port_c.c"


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) "$(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
	@rm -f $(IntermediateDirectory)/__rt_entry.S
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM "$(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S"

-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	@echo Cleaning target...
	@rm -rf $(IntermediateDirectory)/ $(ObjectsFileList) alios.mk Lst/

clean_internal:
	@rm -rf $(IntermediateDirectory)/*.o $(IntermediateDirectory)/.d $(IntermediateDirectory)/*.d $(IntermediateDirectory)/*.a $(IntermediateDirectory)/*.elf $(IntermediateDirectory)/*.ihex Lst/

