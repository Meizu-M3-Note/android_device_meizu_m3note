LOCAL_PATH := device/meizu/m3note

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz-dtb
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:Image.gz-dtb \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.mt6755.rc:root/init.recovery.mt6755.rc \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.usb.rc:root/init.recovery.usb.rc \
    $(LOCAL_PATH)/rootdir/sbin/healthd:root/sbin/healthd

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := m3note
