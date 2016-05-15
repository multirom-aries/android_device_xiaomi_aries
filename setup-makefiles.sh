#!/bin/bash

VENDOR=xiaomi
DEVICE=aries
OUTDIR=vendor/$VENDOR/$DEVICE
MAKEFILE=../../../$OUTDIR/$DEVICE-vendor-blobs.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2014 The CyanogenMod Project
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

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

PRODUCT_COPY_FILES += \\
EOF

LINEEND=" \\"
COUNT=`cat proprietary-blobs.txt | grep -v ^# | grep -v ^$ | wc -l | awk {'print $1'}`
for FILE in `cat proprietary-blobs.txt | grep -v ^# | grep -v ^$ `; do
    COUNT=`expr $COUNT - 1`
    if [ $COUNT = "0" ]; then
        LINEEND=""
    fi
    if [[ ! "$FILE" =~ ^-.* ]]; then
        FILE=`echo $FILE | sed -e "s/^-//g"`
        echo "    $OUTDIR/proprietary/$FILE:system/$FILE$LINEEND" >> $MAKEFILE
    fi
done

(cat << EOF) > ../../../$OUTDIR/$DEVICE-vendor.mk
# Copyright (C) 2014 The CyanogenMod Project
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

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := vendor/$VENDOR/$DEVICE/overlay

\$(call inherit-product, vendor/$VENDOR/$DEVICE/$DEVICE-vendor-blobs.mk)
EOF

(cat << EOF) > ../../../$OUTDIR/Android.mk
# Copyright (C) 2013 The CyanogenMod Project
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

# This file is generated by device/$VENDOR/$DEVICE/setup-makefiles.sh

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),aries)

include \$(CLEAR_VARS)
LOCAL_MODULE := libqminvapi
LOCAL_MODULE_OWNER := qcom
LOCAL_SRC_FILES := proprietary/lib/libqminvapi.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include \$(BUILD_PREBUILT)

endif
EOF
