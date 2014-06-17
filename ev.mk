# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH  := 480

DEVICE_PACKAGE_OVERLAYS += device/htc/pico/overlay

## Specify phone tech before including full_phone
$(call inherit-product, vendor/ev/config/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/htc/pico/pico.mk)

# Inherit some common Evervolv stuff.
$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, vendor/ev/config/common_full_phone.mk)
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += vendor/ev/overlay/hot_reboot

PRODUCT_RELEASE_NAME := Explorer

# Product name
PRODUCT_NAME := ev_pico
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := pico
PRODUCT_MODEL := Explorer A310e
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=pico BUILD_ID=KVT49L BUILD_FINGERPRINT=htc_europe/htc_pico/pico:4.4.3/KVT49L/87995:user/release-keys
PRIVATE_BUILD_DESC="1.28.401.1 CL207463 release-keys"
