# Release name
PRODUCT_RELEASE_NAME := Nexus5

# Inherit device configuration
$(call inherit-product, device/lge/hammerhead/aosp_hammerhead.mk)

# Inherit some common stuff
$(call inherit-product, vendor/nougat/configs/common.mk)
$(call inherit-product, vendor/nougat/configs/common_full_phone.mk)

# Override build properties
PRODUCT_DEVICE := hammerhead
PRODUCT_NAME := nougat_hammerhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE
TARGET_VENDOR := lge

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hammerhead \
    BPRIVATE_BUILD_DESC="hammerhead-user 7.0 NRD90U 3155372 release-keys" \
    BUILD_FINGERPRINT="google/hammerhead/hammerhead:7.0/NRD90U/3155372:user/release-keys"

# Target device
export TARGET_DEVICE := hammerhead

