LOCAL_PATH = $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := netutils.c
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := libshim_ifc
LOCAL_C_INCLUDES += system/core/libnetutils/include
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := media.cpp
LOCAL_SHARED_LIBRARIES := libbinder libmedia
LOCAL_MODULE := libshim_media
LOCAL_CFLAGS := -Wno-unused-variable -Wno-unused-parameter
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := pthread.cpp
LOCAL_SHARED_LIBRARIES := libbinder libc
LOCAL_MODULE := libshim_pthread
LOCAL_CFLAGS := -Wno-unused-variable -Wno-unused-parameter
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
