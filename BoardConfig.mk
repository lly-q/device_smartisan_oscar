# Copyright (C) 2016 The CyanogenMod Project
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
#######################################################################
# BoardConfig.mk is to define the properties of the compilation target, 
# such as the kernel, the location of the device tree, and other flags.
#######################################################################
# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8953
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := \
    device/smartisan/oscar/bluetooth/include

# configfs
TARGET_FS_CONFIG_GEN := \
    device/smartisan/oscar/config.fs


# Kernel
BOARD_KERNEL_BASE := 0x80000000
# If you want to get BOARD_KERNEL_CMDLINE, you can retrieve the old device tree or in you phone in put cat /proc/cmdline
BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8 
BOARD_KERNEL_CMDLINE += androidboot.console=ttyHSL0 
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom 
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237 
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3 
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci 
BOARD_KERNEL_CMDLINE += earlycon=msm_hsl_uart,0x78af000 
BOARD_KERNEL_CMDLINE += buildvariant=user
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
NEED_KERNEL_MODULE_VENDOR := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/smartisan/msm8953
TARGET_KERNEL_CONFIG := lineage_oscar_defconfig
TARGET_KERNEL_CLANG_COMPILE := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Partitions
#BOOTIMAGE flags are in the boot, you can unpack it and fine them.
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false 

# SELinux
include device/qcom/sepolicy/sepolicy.mk

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_QCOM_RTC_FIX := true # Fix the time but now it seems that it can be detected automatically,you can clean up.
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/recovery.fstab

# inherit from the proprietary version
-include vendor/smartisan/oscar/BoardConfigVendor.mk