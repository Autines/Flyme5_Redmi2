#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10590208 22071d9a79244e0a4ad4560c7802cd2f7bb66a71 8323072 20ccbb3079b0cd756487b52427616161ed777397
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:10590208:22071d9a79244e0a4ad4560c7802cd2f7bb66a71; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:8323072:20ccbb3079b0cd756487b52427616161ed777397 EMMC:/dev/block/bootdevice/by-name/recovery 22071d9a79244e0a4ad4560c7802cd2f7bb66a71 10590208 20ccbb3079b0cd756487b52427616161ed777397:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
