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

DEVICE_PATH := device/motorola/bronco

# Inherit from motorola sm8475-common
include device/motorola/sm8475-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bronco

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/device_framework_matrix_bronco.xml
DEVICE_MANIFEST_CAPE_FILES += $(DEVICE_PATH)/manifest_bronco.xml
ODM_MANIFEST_SKUS += sku-ds-nfc_ese-p
ODM_MANIFEST_SKU-DS-NFC_ESE-P_FILES := $(DEVICE_PATH)/manifest_sku-ds-nfc_ese.xml
ODM_MANIFEST_SKUS += sku-ss-nfc_ese-p
ODM_MANIFEST_SKU-SS-NFC_ESE-P_FILES := $(DEVICE_PATH)/manifest_sku-ss-nfc_ese.xml $(COMMON_PATH)/manifest_cape_ss.xml
ODM_MANIFEST_SKUS += sku-ds-nfc_ese
ODM_MANIFEST_SKU-DS-NFC_ESE_FILES := $(DEVICE_PATH)/manifest_sku-ds-nfc_ese.xml
ODM_MANIFEST_SKUS += sku-ss-nfc_ese
ODM_MANIFEST_SKU-SS-NFC_ESE_FILES := $(DEVICE_PATH)/manifest_sku-ss-nfc_ese.xml $(COMMON_PATH)/manifest_cape_ss.xml
ODM_MANIFEST_SKUS += sku-ds-nfc-p
ODM_MANIFEST_SKU-DS-NFC-P_FILES := $(DEVICE_PATH)/manifest_sku-ds-nfc.xml
ODM_MANIFEST_SKUS += sku-ss-nfc-p
ODM_MANIFEST_SKU-SS-NFC-P_FILES := $(DEVICE_PATH)/manifest_sku-ss-nfc.xml $(COMMON_PATH)/manifest_cape_ss.xml
ODM_MANIFEST_SKUS += sku-ds-nfc
ODM_MANIFEST_SKU-DS-NFC_FILES := $(DEVICE_PATH)/manifest_sku-ds-nfc.xml
ODM_MANIFEST_SKUS += sku-ss-nfc
ODM_MANIFEST_SKU-SS-NFC_FILES := $(DEVICE_PATH)/manifest_sku-ss-nfc.xml $(COMMON_PATH)/manifest_cape_ss.xml

# Kernel
TARGET_KERNEL_CONFIG += \
	vendor/ext_config/moto-waipio-bronco.config

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 7329546240 # ( BOARD_SUPER_PARTITION_SIZE - 4MB )
BOARD_SUPER_PARTITION_SIZE := 7333740544

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
BOOT_SECURITY_PATCH := 2024-08-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 22
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 22

# inherit from the proprietary version
include vendor/motorola/bronco/BoardConfigVendor.mk
