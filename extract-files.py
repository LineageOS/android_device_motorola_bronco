#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.extract import extract_fns_user_type
from extract_utils.extract_star import (
    extract_star_firmware,
    star_firmware_regex,
)
from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import lib_fixups
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/motorola/sm8475-common',
    'hardware/qcom-caf/sm8450',
    'vendor/qcom/opensource/commonsys-intf/display',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib64/libcamximageformatutils.so': blob_fixup().replace_needed(
        'vendor.qti.hardware.display.config-V2-ndk_platform.so',
        'vendor.qti.hardware.display.config-V2-ndk.so',
    ),
    'vendor/lib64/nfc_nci.nqx.default.hw.so': blob_fixup().replace_needed(
        'libbase.so',
        'libbase-v33.so',
    ),
}

extract_fns: extract_fns_user_type = {
    star_firmware_regex: extract_star_firmware,
}

module = ExtractUtilsModule(
    'bronco',
    'motorola',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_generated_carriersettings=True,
    add_firmware_proprietary_file=True,
    extract_fns=extract_fns,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sm8475-common', module.vendor)
    utils.run()
