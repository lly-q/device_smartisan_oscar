# Copyright (C) 2017-2018 The LineageOS Project
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

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	device/smartisan/oscar/overlay \
	device/smartisan/oscar/overlay-lineage

# Inherit from those products. Most specific first. Product API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

$(call inherit-product-if-exists, vendor/smartisan/oscar/oscar-vendor.mk)

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# VNDK
PRODUCT_PACKAGES += \
    vndk_package

PRODUCT_PACKAGES += \
	vndk-sp
