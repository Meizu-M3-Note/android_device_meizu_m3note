#
# Copyright 2020 The LineageOS Project.
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

DEVICE_PATH := device/meizu/m3note

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Screen Density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.default \
    libaudio-resampler \
    libtinycompress \
    libtinyxml

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_device.xml:system/etc/audio_device.xml \
    $(DEVICE_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(DEVICE_PATH)/audio/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml \
    $(DEVICE_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_PACKAGES += \
    Snap

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# CMActions
PRODUCT_PACKAGES += \
    CMActions

# Doze
PRODUCT_PACKAGES += \
    MeizuDoze

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs

# GPS
PRODUCT_PACKAGES += \
    libcurl \
    libnl_2

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/gps/gps.conf:system/etc/gps.conf

# Graphics
PRODUCT_PACKAGES += \
    libGLES_android \
    libion \
    libstlport \
    libgui_ext \
    libui_ext \
    libgralloc_extra

# Keyhandler
PRODUCT_PACKAGES += \
    com.cyanogenmod.keyhandler

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
    $(DEVICE_PATH)/keylayout/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl

# Lights
PRODUCT_PACKAGES += \
    lights.mt6755

# LiveDisplay
PRODUCT_PACKAGES += \
    libjni_livedisplay

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Shim Libraries
PRODUCT_PACKAGES += \
    libshim_ifc \
    libshim_media \
    libshim_pthread \
    libshim_wvm \
    libshim_gui \
    libshim_ui \
    libshim_sensorlistener \
    libshim_program_binary \
    libshim_surface \
    libshim_icu \
    libshim_ssl \
    libshim_crypto \
    libshim_string \
    libshim_vtservice \
    libshim_binder

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    $(LOCAL_PATH)/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Power
PRODUCT_PACKAGES += \
    power.mt6755

# Props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.mount.fs=EXT4 \
    persist.service.acm.enable=0 \
    camera.disable_zsl_mode=1

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# Rootdir
PRODUCT_PACKAGES += \
    enableswap.sh \
    fstab.mt6755 \
    init.modem.rc \
    init.mt6755.rc \
    init.mt6755.usb.rc \
    init.nvdata.rc \
    init.project.rc \
    init.trustonic.rc \
    ueventd.mt6755.rc

# Telephony
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/telephony/apns-conf.xml:system/etc/apns-conf.xml \
    $(DEVICE_PATH)/telephony/ecc_list.xml:system/etc/ecc_list.xml \
    $(DEVICE_PATH)/telephony/spn-conf.xml:system/etc/spn-conf.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/thermal/thermal.conf:system/etc/.tp/thermal.conf \
    $(DEVICE_PATH)/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf \
    $(DEVICE_PATH)/thermal/.ht120.mtc:system/etc/.tp/.ht120.mtc \
    $(DEVICE_PATH)/thermal/.thermal_meta.conf:system/etc/.tp/.thermal_meta.conf \
    $(DEVICE_PATH)/thermal/.thermal_policy_00:system/etc/.tp/.thermal_policy_00 \
    $(DEVICE_PATH)/thermal/.thermal_policy_01:system/etc/.tp/.thermal_policy_01 \
    $(DEVICE_PATH)/thermal/.thermal_policy_02:system/etc/.tp/.thermal_policy_02

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    hostapd_cli \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(DEVICE_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Dalvik Tweak
PRODUCT_TAGS += dalvik.gc.type-precise

# Call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Vendor
$(call inherit-product-if-exists, vendor/meizu/m3note/m3note-vendor.mk)
