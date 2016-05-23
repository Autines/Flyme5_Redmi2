#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10633216 530ad332760f5c801b28cf58136bdcdef1b7d772 8364032 3bb212fea6de9a22f53959a494a4301f7e3cfc8b
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:10633216:530ad332760f5c801b28cf58136bdcdef1b7d772; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:8364032:3bb212fea6de9a22f53959a494a4301f7e3cfc8b EMMC:/dev/block/bootdevice/by-name/recovery 530ad332760f5c801b28cf58136bdcdef1b7d772 10633216 3bb212fea6de9a22f53959a494a4301f7e3cfc8b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
