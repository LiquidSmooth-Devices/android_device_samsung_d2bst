#!/system/bin/sh
#

while [ ! `getprop sys.boot_completed` ]
do
  sleep 5
done

# Move in Boost Mobile apns
busybox rm /system/etc/apns-conf.xml
busybox mv /system/etc/apns-conf_d2bst.xml /system/etc/apns-conf.xml

# Move in Boost Mobile eri
busybox mv /system/etc/eri-boost.xml /data/eri.xml

# Set preferred apn
busybox mkdir -p /data/data/com.android.providers.telephony/shared_prefs
busybox cp /system/preferred-apn1.xml /data/data/com.android.providers.telephony/shared_prefs/preferred-apn1.xml
busybox rm /system/preferred-apn1.xml

# Remove Telephony Databases
busybox rm -f /data/data/com.android.providers.telephony/databases/telephony.db-journal

# clean up
rm -f /data/d2bst-firstboot.sh

#force mobile data to restart
sleep 20
svc data disable
sleep 2
svc data enable
