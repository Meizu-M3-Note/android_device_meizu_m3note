# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/meizu/m3note/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_RELEASE_NAME := Meizu M3 Note
PRODUCT_DEVICE := m3note
PRODUCT_NAME := cm_m3note
PRODUCT_BRAND := Meizu
PRODUCT_MODEL := M3 Note
PRODUCT_MANUFACTURER := Meizu
PRODUCT_GMS_CLIENTID_BASE := android-meizu

# Set product device & name
PRODUCT_BUILD_PROP_OVERRIDES += \
   TARGET_DEVICE=m3note \
   PRODUCT_NAME=m3note

# Use the latest approved GMS identifiers unless running a signed build
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Meizu/meizu_m3note/m3note:5.1/LMY47I/1491737988:user/release-keys \
    PRIVATE_BUILD_DESC="meizu_m3note-user 5.1 LMY47I 1491737988 release-keys"
