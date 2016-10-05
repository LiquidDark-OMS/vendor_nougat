# Release name
PRODUCT_RELEASE_NAME := Nexus6P

# Inherit device configuration
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Inherit some common stuff
$(call inherit-product, vendor/nougat/configs/common.mk)
$(call inherit-product, vendor/nougat/configs/common_full_phone.mk)

# Override build properties
PRODUCT_DEVICE := angler
PRODUCT_NAME := nougat_angler
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei
TARGET_VENDOR := huawei

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    PRIVATE_BUILD_DESC="angler-user 7.0 NBD90X 3254009 release-keys" \
    BUILD_FINGERPRINT="google/angler/angler:7.0/NBD90X/3254009:user/release-keys"

# Target device
export TARGET_DEVICE := angler

