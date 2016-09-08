# Inherit additional stuff
$(call inherit-product, vendor/nougat/configs/common.mk)

# Wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker
