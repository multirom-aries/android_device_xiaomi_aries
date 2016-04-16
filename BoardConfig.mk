#
# Copyright (C) 2011 The Android Open-Source Project
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

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/xiaomi/aries/init/init_aries.cpp

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=aries lpj=67677 user_debug=31 lge.kcal=0|0|0|x
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/aries
TARGET_KERNEL_CONFIG := cyanogen_aries_defconfig

BOARD_USES_ALSA_AUDIO:= true
BOARD_USES_LEGACY_ALSA_AUDIO:= false
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_AUDIO_AMPLIFIER := device/xiaomi/aries/libaudioamp
BOARD_USES_QCOM_HARDWARE := true
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := ARIES
TARGET_BOOTLOADER_NAME=aries
TARGET_BOARD_INFO_FILE := device/xiaomi/aries/board-info.txt

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/aries/bluetooth

# Use the QCOM PowerHAL
TARGET_POWERHAL_VARIANT := qcom

# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL := true
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_WCNSS_MAC_PREFIX := e8bba8
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WPA_SUPPLICANT_VERSION  := VER_0_8_X

BOARD_EGL_CFG := device/xiaomi/aries/egl.cfg

#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

TARGET_RECOVERY_FSTAB = device/xiaomi/aries/fstab.aries
RECOVERY_FSTAB_VERSION = 2
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 15728640 # 15M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640 # 15M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912 # 512M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3758096384 # 3.5G
BOARD_CACHEIMAGE_PARTITION_SIZE := 402999808 # 384.3 MByte
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_USES_SECURE_SERVICES := true

BOARD_USES_EXTRA_THERMAL_SENSOR := true
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.aries

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_USES_QC_TIME_SERVICES := true
TARGET_NO_RPC := true
TARGET_PROVIDES_GPS_LOC_API := true

BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_NO_CELLINFOLIST := true

TARGET_RELEASETOOLS_EXTENSIONS := device/xiaomi/aries


# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_CHARGER_ENABLE_SUSPEND := true

USE_DEVICE_SPECIFIC_CAMERA:= true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY:= true

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

HAVE_ADRENO_SOURCE:= false

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

MALLOC_IMPL := dlmalloc

-include vendor/xiaomi/aries/BoardConfigVendor.mk

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_HARDWARE_CLASS := device/xiaomi/aries/mkhw/

TARGET_USES_LOGD := false

## TWRP 
#DEVICE_RESOLUTION := 720x1280
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_FLASH_FROM_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_TARGET_USES_QCOM_BSP := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
