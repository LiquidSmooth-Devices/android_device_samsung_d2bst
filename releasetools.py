# Copyright (C) 2012 The Android Open Source Project
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
#

""" Custom OTA commands for d2bst """

def FullOTA_InstallEnd(info):
  info.script.AppendExtra('run_program("/sbin/sh", "-c", "busybox rm -f /system/etc/apns-conf.xml");')
  info.script.AppendExtra('run_program("/sbin/sh", "-c", "busybox mv /system/etc/apns-conf-boost.xml /system/etc/apns-conf.xml");')
  info.script.AppendExtra('ifelse(is_mounted("/data"), unmount("/data"));')
  info.script.AppendExtra('mount("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/userdata", "/data", "");')
  info.script.AppendExtra('run_program("/sbin/sh", "-c", "busybox mv /system/etc/eri-boost.xml /data/eri.xml");')
  info.script.SetPermissions("/data/eri.xml", 0, 0, 0666, None, None)
  info.script.AppendExtra('run_program("/sbin/sh", "-c", "busybox rm -f /data/data/com.android.providers.telephony/databases/telephony.db");')
  info.script.AppendExtra('run_program("/sbin/sh", "-c", "busybox rm -f /data/data/com.android.providers.telephony/databases/telephony.db-journal");')
  info.script.AppendExtra('run_program("/sbin/sh", "-c", "busybox mkdir -p /data/data/com.android.providers.telephony/shared_prefs");')
  info.script.AppendExtra('run_program("/sbin/sh", "-c", "busybox mv /system/etc/preferred-apn1.xml /data/data/com.android.providers.telephony/shared_prefs/preferred-apn1.xml");')
  info.script.SetPermissions("/data/data/com.android.providers.telephony/shared_prefs/preferred-apn1.xml", 1001, 1001, 0660, None, None)
  info.script.AppendExtra('unmount("/data");')
