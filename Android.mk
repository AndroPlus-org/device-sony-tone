ifeq ($(filter-out qcom,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif

$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libminui_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libminui_intermediates/export_includes)

