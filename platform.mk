# Copyright (C) 2014 The Android Open Source Project
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

$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

# Disable Block based building if https://github.com/Sony-tone/android_buildable_ota exists
$(call inherit-product-if-exists, buildable/ota/DisableBlockBasedOTA.mk)

SOMC_PLATFORM := qcom

LOCAL_PATH := device/sony/tone

SONY_ROOT := device/sony/tone/rootdir

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    $(SONY_ROOT)/system/etc/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(SONY_ROOT)/system/etc/audio_platform_info_i2s.xml:system/etc/audio_platform_info_i2s.xml \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
	$(SONY_ROOT)/system/etc/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(SONY_ROOT)/system/etc/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	$(SONY_ROOT)/system/etc/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	$(SONY_ROOT)/system/etc/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
	$(SONY_ROOT)/system/etc/mixer_paths_i2s.xml:system/etc/mixer_paths_i2s.xml \
	$(SONY_ROOT)/system/etc/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
	$(SONY_ROOT)/system/etc/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml

# Broadcom BT
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/bluetooth/iot_devlist.conf:system/etc/bluetooth/iot_devlist.conf

ifneq ($(TARGET_DEVICE), suzuran)
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf
endif    

# IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc \
    $(SONY_ROOT)/system/usr/idc/touch_fusion.idc:system/usr/idc/touch_fusion.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/clearpad.kl:system/usr/keylayout/clearpad.kl \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(SONY_ROOT)/system/usr/keylayout/mhl-rcp.kl:system/usr/keylayout/mhl-rcp.kl \
    $(SONY_ROOT)/system/usr/keylayout/msm8994-tomtom-snd-card_Button_Jack.kl:system/usr/keylayout/msm8994-tomtom-snd-card_Button_Jack.kl \
    $(SONY_ROOT)/system/usr/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    $(SONY_ROOT)/system/usr/keylayout/touch_fusion.kl:system/usr/keylayout/touch_fusion.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/msm_irqbalance.conf:system/etc/msm_irqbalance.conf

# QMI
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/data/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(SONY_ROOT)/system/etc/data/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(SONY_ROOT)/system/etc/data/qmi_config.xml:system/etc/data/qmi_config.xml

# TORCH
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/torch/torch:system/bin/torch


# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# Recovery
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/fstab.qcom:root/fstab.qcom \
    $(SONY_ROOT)/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(SONY_ROOT)/sbin/postrecoveryboot.sh:root/sbin/postrecoveryboot.sh \
    $(SONY_ROOT)/sbin/qseecomd:root/sbin/qseecomd \
    $(SONY_ROOT)/vendor/lib64/hw/keystore.msm8996.so:root/vendor/lib64/hw/keystore.msm8996.so \
    $(SONY_ROOT)/vendor/lib64/lib-sec-disp.so:root/vendor/lib64/lib-sec-disp.so \
    $(SONY_ROOT)/vendor/lib64/libGPreqcancel.so:root/vendor/lib64/libGPreqcancel.so \
    $(SONY_ROOT)/vendor/lib64/libGPreqcancel_svc.so:root/vendor/lib64/libGPreqcancel_svc.so \
    $(SONY_ROOT)/vendor/lib64/libQSEEComAPI.so:root/vendor/lib64/libQSEEComAPI.so \
    $(SONY_ROOT)/vendor/lib64/libStDrvInt.so:root/vendor/lib64/libStDrvInt.so \
    $(SONY_ROOT)/vendor/lib64/libdiag.so:root/vendor/lib64/libdiag.so \
    $(SONY_ROOT)/vendor/lib64/libdrmfs.so:root/vendor/lib64/libdrmfs.so \
    $(SONY_ROOT)/vendor/lib64/libdrmtime.so:root/vendor/lib64/libdrmtime.so \
    $(SONY_ROOT)/vendor/lib64/libqisl.so:root/vendor/lib64/libqisl.so \
    $(SONY_ROOT)/vendor/lib64/librpmb.so:root/vendor/lib64/librpmb.so \
    $(SONY_ROOT)/vendor/lib64/libsecureui.so:root/vendor/lib64/libsecureui.so \
    $(SONY_ROOT)/vendor/lib64/libsecureui_svcsock.so:root/vendor/lib64/libsecureui_svcsock.so \
    $(SONY_ROOT)/vendor/lib64/libssd.so:root/vendor/lib64/libssd.so \
    $(SONY_ROOT)/vendor/lib64/libtime_genoff.so:root/vendor/lib64/libtime_genoff.so

# Time Zone data for recovery
PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:root/system/usr/share/zoneinfo/tzdata

# Platform Init
PRODUCT_PACKAGES += \
    fstab.tone \
    init.tone.pwr

# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag \
    nfc_nci.pn54x.default

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8994

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8994 \
    gralloc.msm8994 \
    hwcomposer.msm8994 \
    memtrack.msm8994

# GPS
PRODUCT_PACKAGES += \
    gps.msm8994

# Power
PRODUCT_PACKAGES += \
    power.msm8994

# CAMERA
PRODUCT_PACKAGES += \
    libmmcamera_interface \
    libmmjpeg_interface \
    libmm-qcamera \
    libqomx_core \
    libstlport \
    camera.msm8994

# RILD
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=NV,RUIM

# system prop for opengles version
# 196609 is decimal for 0x30001 to
# report major/minor versions as 3/1
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609

# QCOM Proprietary perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so
