# Copyright (C) 2016 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Written for SaberMod toolchains
# TARGET_SM_AND can be set before this file to override the default of gcc 4.8 for ROM.
# This is to avoid hardcoding the gcc versions for the ROM and kernels.

 TARGET_SM_AND := $(TARGET_GCC_VERSION)
 TARGET_SM_KERNEL := $(TARGET_GCC_VERSION_KERNEL)

 # Set GCC colors
 export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

 # Find host os
 UNAME := $(shell uname -s)

 HOST_OS := linux

 # Path to kernel toolchain
 SM_KERNEL_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/aarch64/aarch64-$(TARGET_SM_KERNEL)
 SM_KERNEL := $(shell $(SM_KERNEL_PATH)/bin/aarch64-gcc --version)

 SM_KERNEL_NAME := $(filter %sabermod,$(SM_KERNEL))
 SM_KERNEL_DATE := $(filter 20140% 20141% 20150% 20151% 2016%,$(SM_KERNEL))
 SM_KERNEL_STATUS := $(filter (release) (prerelease) (experimental),$(SM_KERNEL))
 SM_KERNEL_VERSION := $(SM_KERNEL_NAME)-$(SM_KERNEL_DATE)-$(SM_KERNEL_STATUS)

  PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.kernel=$(SM_KERNEL_VERSION)

 # Add extra libs for the compilers to use
 export LD_LIBRARY_PATH := $(TARGET_ARCH_LIB_PATH):$(LD_LIBRARY_PATH)
 export LIBRARY_PATH := $(TARGET_ARCH_LIB_PATH):$(LIBRARY_PATH)

