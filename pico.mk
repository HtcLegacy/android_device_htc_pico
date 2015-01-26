# Copyright (C) 2011 The Android Open Source Project
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

# proprietary side of the device
# Inherit from those products. Most specific first

# Inherit common msm7x27a configs
$(call inherit-product, device/htc/msm7x27a-common/msm7x27a.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/htc/pico/vendor_pico.mk)

# Bluetooh
PRODUCT_PACKAGES += \
    brcm_patchram_plus

# Build sim toolkit
PRODUCT_PACKAGES += \
    Stk	
    
# Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
	
# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab.pico:root/fstab.pico \
	$(LOCAL_PATH)/ramdisk/recovery/twrp.fstab:root/etc/twrp.fstab \
    $(LOCAL_PATH)/ramdisk/init.pico.rc:root/init.pico.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.pico.rc:root/ueventd.pico.rc \
    $(LOCAL_PATH)/ramdisk/init.pico.usb.rc:root/init.pico.usb.rc
    
# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/hw/camera.vendor.msm7x27a.so:system/lib/hw/camera.vendor.msm7x27a.so \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml
    
# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1 \
    ro.adb.secure=0

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml 

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/firmware/fw_bcmdhd.bin:system/etc/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/prebuilt/etc/firmware/fw_bcmdhd_apsta.bin:system/etc/firmware/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/prebuilt/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf
    
# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/prebuilt/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
    $(LOCAL_PATH)/prebuilt/etc/AudioPara4.csv:system/etc/AudioPara4.csv \
    $(LOCAL_PATH)/prebuilt/etc/AudioPara4_WB.csv:system/etc/AudioPara4_WB.csv \
    $(LOCAL_PATH)/prebuilt/etc/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    $(LOCAL_PATH)/prebuilt/etc/AudioFilter_HP.csv:system/etc/AudioFilter_HP.csv \
    $(LOCAL_PATH)/prebuilt/lib/libaudioeq.so:system/lib/libaudioeq.so \
    $(LOCAL_PATH)/prebuilt/lib/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
    $(LOCAL_PATH)/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

#    $(LOCAL_PATH)/prebuilt/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
#    $(LOCAL_PATH)/prebuilt/lib/libaudioalsa.so:system/lib/libaudioalsa.so

# 3D(AU_LINUX_ANDROID_KK_2.7_RB1.04.04.00.007.018)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    $(LOCAL_PATH)/prebuilt/etc/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg

# Misc Blobs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bin/bma150_usr:system/bin/bma150_usr \
    $(LOCAL_PATH)/prebuilt/bin/htc_ebdlogd:system/bin/htc_ebdlogd \
    $(LOCAL_PATH)/prebuilt/bin/logcat2:system/bin/logcat2 \

# DeviceSettings
# PRODUCT_PACKAGES += \
#     DeviceSettings

#Int2Ext
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/40int2ext:system/etc/40int2ext

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keychars/pico-keypad.kcm.bin:system/usr/keychars/pico-keypad.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/pico-keypad.kl:system/usr/keylayout/pico-keypad.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    $(LOCAL_PATH)/prebuilt/usr/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/pico-keypad.idc:system/usr/idc/pico-keypad.idc \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl
	
# HTCLEGACY Updater
PRODUCT_PACKAGES += \
	HLUpdater

ifeq ($(TARGET_UNOFFICIAL_BUILD_ID),)
PRODUCT_PROPERTY_OVERRIDES += ro.hl.releasetype=NIGHTLY
else
PRODUCT_PROPERTY_OVERRIDES += ro.hl.releasetype=SNAPSHOT
endif	