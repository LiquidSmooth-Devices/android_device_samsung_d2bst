#!/sbin/sh
#
# Use Boost Mobile apns-conf.xml
#

# Move in Boost Mobile apns
busybox rm /system/etc/apns-conf.xml
busybox mv /system/etc/apns-conf_d2bst.xml /system/etc/apns-conf.xml

# Move in Boost Mobile eri
busybox mv /system/etc/eri-boost.xml /data/eri.xml

# Set preferred apn
busybox mkdir -p /data/data/com.android.providers.telephony/shared_prefs
busybox cp /system/preferred-apn1.xml /data/data/com.android.providers.telephony/shared_prefs/preferred-apn1.xml
busybox rm /system/preferred-apn1.xml

# Add firstboot script
busybox cp /system/d2bst-firstboot.sh /data/d2bst-firstboot.sh
busybox rm /system/d2bst-firstboot.sh
