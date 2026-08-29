#
# Copyright (C) 2025 The LineageOS Project
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

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 400dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/sku_parrot/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_parrot/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/sku_parrot/audio_policy_configuration_tmo.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_parrot/audio_policy_configuration_tmo.xml \
    $(LOCAL_PATH)/configs/audio/sku_parrot/mixer_paths_parrot_qrd_sku1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_parrot/mixer_paths_parrot_qrd_sku1.xml \
    $(LOCAL_PATH)/configs/audio/sku_parrot/resourcemanager_parrot_qrd_sku1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_parrot/resourcemanager_parrot_qrd_sku1.xml \
    $(LOCAL_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes_tmo.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes_tmo.xml \
    $(LOCAL_PATH)/configs/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# LiveDisplay
$(call soong_config_set_bool,livedisplay_sysfs,enable_af,true)

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st \
    com.android.nfc_extras \
    Tag

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResDevice \
    LineageSystemUIDevice \
    SettingsResDevice \
    SystemUIResDevice \
    UpdaterResDevice \
    WifiResDevice

# Screen
TARGET_SCREEN_DENSITY := 400

# Shipping API Level
BOARD_SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 34

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Vibrator
$(call soong_config_set,qti_vibrator,effect_lib,libqtivibratoreffect.moto_sm7435-richtap)
$(call soong_config_set_bool,qti_vibrator,use_effect_stream,true)

# Inherit from motorola sm7435-common
$(call inherit-product, device/motorola/sm7435-common/common.mk)

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/cusco/cusco-vendor.mk)
