#
# Copyright (C) 2022 The LineageOS Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Screen
TARGET_SCREEN_DENSITY := 400

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 400dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

BOARD_SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 33

# Inherit from motorola sm8475-common
$(call inherit-product, device/motorola/sm8475-common/sm8475.mk)

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResDevice \
    LineageSdkDevice \
    LineageSystemUIDevice \
    SystemUIResDevice

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/sku_cape/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/sku_cape/mixer_paths_waipio_mtp_hdr.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_mtp_hdr.xml \
    $(LOCAL_PATH)/configs/audio/sku_cape/resourcemanager_waipio_mtp_hdr.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_mtp_hdr.xml \
    $(LOCAL_PATH)/configs/audio/sku_cape_qssi/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape_qssi/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/configs/audio/microphone_characteristics.xml:$(TARGET_COPY_OUT_VENDOR)/etc/microphone_characteristics.xml \
    $(LOCAL_PATH)/configs/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.moto \
    libudfpshandler_moto \
    vendor.egistec.hardware.fingerprint@4.0-vintf

# Init
PRODUCT_PACKAGES += \
    init.mmi.overlay.rc

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    com.android.nfc_extras \
    nqnfcinfo \
    Tag

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ds-nfc_ese-p/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ds-nfc_ese/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ss-nfc_ese-p/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ss-nfc_ese/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ds-nfc_ese-p/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ds-nfc_ese/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ss-nfc_ese-p/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku-ss-nfc_ese/android.hardware.se.omapi.ese.xml

# Properties
PRODUCT_PACKAGES += \
    hardware.sku.XT2309-2.prop \
    hardware.sku.XT2309-3.prop \
    hardware.sku.XT2309-4.prop

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# VINTF
ODM_MANIFEST_SKUS += sku-ds-nfc_ese-p
ODM_MANIFEST_SKU-DS-NFC_ESE-P_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ds-nfc_ese.xml
ODM_MANIFEST_SKUS += sku-ss-nfc_ese-p
ODM_MANIFEST_SKU-SS-NFC_ESE-P_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ss-nfc_ese.xml \
    device/motorola/sm8475-common/vintf/manifest_ss.xml
ODM_MANIFEST_SKUS += sku-ds-nfc_ese
ODM_MANIFEST_SKU-DS-NFC_ESE_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ds-nfc_ese.xml
ODM_MANIFEST_SKUS += sku-ss-nfc_ese
ODM_MANIFEST_SKU-SS-NFC_ESE_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ss-nfc_ese.xml \
    device/motorola/sm8475-common/vintf/manifest_ss.xml
ODM_MANIFEST_SKUS += sku-ds-nfc-p
ODM_MANIFEST_SKU-DS-NFC-P_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ds-nfc.xml
ODM_MANIFEST_SKUS += sku-ss-nfc-p
ODM_MANIFEST_SKU-SS-NFC-P_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ss-nfc.xml \
    device/motorola/sm8475-common/vintf/manifest_ss.xml
ODM_MANIFEST_SKUS += sku-ds-nfc
ODM_MANIFEST_SKU-DS-NFC_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ds-nfc.xml
ODM_MANIFEST_SKUS += sku-ss-nfc
ODM_MANIFEST_SKU-SS-NFC_FILES := $(LOCAL_PATH)/vintf/manifest_sku-ss-nfc.xml \
    device/motorola/sm8475-common/vintf/manifest_ss.xml

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/bronco/bronco-vendor.mk)
