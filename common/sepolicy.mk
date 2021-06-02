#
# This policy configuration will be used by all products that
# inherit from Aosp
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/extended/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/extended/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/extended/sepolicy/common/dynamic \
    device/extended/sepolicy/common/system-only
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/extended/sepolicy/common/dynamic \
    device/extended/sepolicy/common/vendor
endif
