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

#
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH  := 480

DEVICE_PACKAGE_OVERLAYS += device/htc/pico/overlay

# Inherit device configuration
$(call inherit-product, device/htc/pico/pico.mk)

PRODUCT_RELEASE_NAME := Explorer

# Product name
PRODUCT_NAME := aosp_pico
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := pico
PRODUCT_MODEL := Explorer A310e
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=pico BUILD_ID=KTU84M BUILD_FINGERPRINT=htc_europe/htc_pico/pico:4.4.3/KTU84M/87995:user/release-keys
PRIVATE_BUILD_DESC="1.28.401.1 CL207463 release-keys"
