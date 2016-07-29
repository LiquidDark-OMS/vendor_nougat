# Build optimizations
include vendor/nougat/configs/optimize/optimize.mk

# Build overrides
ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=0 \
    persist.debug.wfd.enable=1 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.root_access=3 \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0

# Enable MTP by default
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb

# GoogleDNS
PRODUCT_PROPERTY_OVERRIDES += \
    net.rmnet0.dns1=8.8.8.8 \
    net.rmnet0.dns2=8.8.4.4 \
    net.dns1=8.8.8.8 \
    net.dns2=8.8.4.4

# Backup script
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/nougat/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Init.d support
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/bin/sysinit:system/bin/sysinit

# Keyboard gestures
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/nougat/prebuilt/lib64/libjni_keyboarddecoder.so:system/lib64/libjni_keyboarddecoder \
    vendor/nougat/prebuilt/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so

# Ramdisk config
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/etc/init.nougat.rc:root/init.nougat.rc

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/nougat/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Userinit support
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Include packages
PRODUCT_PACKAGES += \
    AOSPLinks \
    Busybox \
    Gallery2 \
    Launcher3 \
    masquerade

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/nougat/overlay/common

# Inherit common build prop overrides
-include vendor/nougat/configs/common_versions.mk

## Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Squisher script
SQUISHER_SCRIPT := vendor/nougat/tools/squisher
