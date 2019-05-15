##
 # Copyright (C) 2017 C-SKY Microsystems Co., All rights reserved.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #   http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.
##

$(info )
$(info *************************************************)
$(info  Use: [make    ] for completely build.)
$(info  Use: [make clean] for remove temporary files .)
$(info *************************************************)
$(info )

#####################################################################
MK_TOOLCHAIN_PREFIX:=
MK_L_OBJS:=
MK_L_SDK_OBJS:=
MK_L_LIBS:=
MK_L_PRE_LIBS:=
MK_L_EXCLUDE_LIBS:=
MK_CFLAGS:=
MK_HOST_BIN:=

#####################################################################
EXE_EXT:=$(shell which ls | grep -o .exe)
MK_BASE_PATH:= .
YOC_DIR := $(MK_BASE_PATH)/../../yoc_sdk

DEFINE_LOCAL:= $(YOC_DIR)/tools/build/core/define_local.mk
BUILD_MODULE:= $(YOC_DIR)/tools/build/core/build_module.mk

include $(MK_BASE_PATH)/defconfig
include $(YOC_DIR)/tools/build/core/toolchain.mk
include $(YOC_DIR)/tools/build/core/functions.mk
YOC_SDK:= $(YOC_DIR)/$(CONFIG_CHIP_CPU)/

#####################################################################
YOC_LIBS := $(CONFIG_LIBS) $(CONFIG_IOT_LIBS)
YOC_DEFS :=
include $(YOC_DIR)/tools/build/core/yoc_defs.mk
MK_CFLAGS+= $(YOC_DEFS)

#####################################################################
CPRE := @
ifeq ($(V),1)
CPRE :=
endif

#####################################################################
TARGETS_ROOT_PATH := $(YOC_DIR)/$(CONFIG_CHIP_CPU)/boards/$(CONFIG_CHIP_VENDOR)/$(CONFIG_BOARD_NAME)
include $(TARGETS_ROOT_PATH)/CFLAGS.mk

#####################################################################
.PHONY:startup
startup: all

all: image hexfiles
	@bash $(YOC_DIR)/tools/build/showmap.bsh

#####################################################################
MK_OUT_PATH:=  out
MK_OUT_PATH_LIB:= $(MK_OUT_PATH)/lib
MK_GENERATED_IMGS_PATH:=generated
BIN_NAME := yoc
IMAGE_FILE := $(MK_OUT_PATH)/$(BIN_NAME)

include src/build.mk

TARGETS_LD_SCRIPT := $(shell echo boards/$(CONFIG_BOARD_NAME)/configs/gcc_eflash.ld)

L_LDFLAGS += -mcpu=$(CONFIG_CHIP_CPU) -nostartfiles -Wl,--gc-sections -lm
L_LDFLAGS += -Wl,-ckmap='$(MK_OUT_PATH)/$(BIN_NAME).map'
L_LDFLAGS += -T $(TARGETS_LD_SCRIPT)
L_LDFLAGS += -L $(YOC_SDK)lib -L $(YOC_SDK)lib/prelibs

image: $(IMAGE_FILE)
$(IMAGE_FILE): $(MK_L_LIBS) $(MK_L_PRE_LIBS)
	@ echo [INFO] Create $(BIN_NAME) images
	$(CPRE) sh $(YOC_DIR)/tools/build/gen_ldfile.sh boards/$(CONFIG_BOARD_NAME)/configs/config.yaml $(TARGETS_LD_SCRIPT).S $(TARGETS_LD_SCRIPT)
	$(CPRE) $(CC) -o $@.elf -Wl,--whole-archive $^ $(YOC_LIBS:%=-l%) $(THIRD_PARTY_LIBS) -Wl,--no-whole-archive $(L_LDFLAGS) -Wl,-zmax-page-size=1024
	$(CPRE) rm $(TARGETS_LD_SCRIPT)

	$(CPRE) $(OBJDUMP) -d $@.elf > $@.asm
	$(CPRE) $(READELF) -s $@.elf > $@.s
	$(CPRE) $(OBJCOPY) -O binary $@.elf $@.bin
	$(CPRE) cp $(MK_OUT_PATH)/$(BIN_NAME).* ./

	$(CPRE) ls .gdbinit >/dev/null 2>&1 || (echo "target jtag jtag://127.0.0.1:1025" > gdbinit && cat boards/$(CONFIG_BOARD_NAME)/script/gdbinit >> gdbinit)

.PHONY:hexfiles
hexfiles:
	@echo [INFO] Create bin files
	$(CPRE) rm -fr $(MK_GENERATED_IMGS_PATH)
	@mkdir $(MK_GENERATED_IMGS_PATH) $(MK_GENERATED_IMGS_PATH)/data -p
	$(CPRE) cp $(TARGETS_ROOT_PATH)/bootimgs/boot $(MK_GENERATED_IMGS_PATH)/data/
	$(CPRE) cp $(TARGETS_ROOT_PATH)/bootimgs/tee $(MK_GENERATED_IMGS_PATH)/data/
	$(CPRE) cp boards/$(CONFIG_BOARD_NAME)/configs/config.yaml $(MK_GENERATED_IMGS_PATH)/data/
	$(CPRE) cp -f yoc.bin $(MK_GENERATED_IMGS_PATH)/data/prim
	$(CPRE) $(YOC_DIR)/tools/build/product$(EXE_EXT) image $(MK_GENERATED_IMGS_PATH)/images.zip -i $(MK_GENERATED_IMGS_PATH)/data -l -p
	$(CPRE) $(YOC_DIR)/tools/build/product$(EXE_EXT) image $(MK_GENERATED_IMGS_PATH)/images.zip -e $(MK_GENERATED_IMGS_PATH) -x
	$(CPRE) rm -fr $(MK_GENERATED_IMGS_PATH)/data

.PHONY:clean
clean:
	rm -fr out yoc.*
