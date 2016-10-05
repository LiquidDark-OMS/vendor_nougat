# Version information
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=NBD90X BUILD_ID=NBD90X BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

ANDROID_NAME := liquidnougat
export ANDROID_NAME

    CUSTOM_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    NOUGAT_POSTFIX := -$(shell date -u +%Y%m%d)

ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(TARGET_DEVICE)

# Property overrides
PRODUCT_PROPERTY_OVERRIDES += \
  ro.nougat.version=$(ROM_VERSION) \
  ro.modversion=$(ROM_VERSION)

# Sabermod version
-include vendor/nougat/configs/optimize/sabermod.mk

# DragonTC info
DRAGONTC_VERSION := 3.8
export $(DRAGONTC_VERSION)

DTC_PATH := prebuilts/clang/host/linux-x86/$(DRAGONTC_VERSION)
DTC_VER := $(shell cat $(DTC_PATH)/VERSION)
export $(DTC_VER)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dtc.version=$(DTC_VER)
