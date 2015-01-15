# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/htc/pico
USE_CAMERA_STUB := true
BOARD_VENDOR := htc

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

TARGET_GLOBAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a5
TARGET_GLOBAL_CPPFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4 -mtune=cortex-a5
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DNO_UPDATE_PREVIEW
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_CAM_PARAMS
COMMON_GLOBAL_CFLAGS += -DUSE_MDP3

# Arch related defines and optimizations
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := false
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_LOWMEM := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := pico

# Compiler Optimization
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true
TARGET_USE_O3 := true

# Optimisations used by Qualcomm
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Don't generate block mode update zips
BLOCK_BASED_OTA := false

# Kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null androidboot.hardware=pico androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x12c00000
BOARD_PAGE_SIZE := 0x00000800

# Additional libraries
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_PROVIDES_LIBAUDIO := true
TARGET_QCOM_TUNNEL_LPA_ENABLED := true
BOARD_QCOM_VOIP_ENABLED := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
#BOARD_USES_SRS_TRUEMEDIA := true

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27a

# Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 262144
TARGET_USERIMAGES_USE_EXT4 := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/htc/pico
TARGET_KERNEL_CONFIG := pico_defconfig

# Vold
BOARD_VOLD_MAX_PARTITIONS := 24
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/vnd_pico.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth/include

# OpenGL drivers config file path
BOARD_EGL_CFG := $(LOCAL_PATH)/prebuilt/lib/egl/egl.cfg

# Wifi related definitions
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_BAND := 802_11_BG
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME := "bcmdhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/fw_bcmdhd.bin nvram_path=/proc/calibration iface_name=wlan0"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"

# Misc
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_HALF_RES := true
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# LOGD
TARGET_USES_LOGD := false

# SELinux
include device/qcom/sepolicy/sepolicy.mk

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
BOARD_USES_QCOM_HARDWARE := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
USE_OPENGL_RENDERER := true
TARGET_USES_QCOM_BSP := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_NO_ADAPTIVE_PLAYBACK := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
HWUI_COMPILE_FOR_PERF := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Media
TARGET_QCOM_LEGACY_OMX := true

# ION Support
TARGET_USES_ION := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
BOARD_USES_PMEM_ADSP := true

# Add h/w acceleration in browser
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

# ART
MALLOC_IMPL := dlmalloc

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

# RIL
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril

# Use Cpu Upload path (webkit)
TARGET_FORCE_CPU_UPLOAD := true

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := bcm4330
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Touch screen compatibility for JB
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Custom liblights
TARGET_PROVIDES_LIBLIGHT := true

# Fonts
#SMALLER_FONT_FOOTPRINT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Power
TARGET_PROVIDES_POWERHAL := true

# TWRP
DEVICE_RESOLUTION := 320x480
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NEVER_UMOUNT_SYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
