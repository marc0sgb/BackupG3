#!/bin/sh

echo "Restaurandom odem1.img";
dd if=/sdcard/backupg3/modemst1.img of=/dev/block/platform/msm_sdcc.1/by-name/modemst1;  
echo "Restaurando modem2.img";
dd if=/sdcard/backupg3/modemst2.img of=/dev/block/platform/msm_sdcc.1/by-name/modemst2;
echo "Restaurando boot.img";
dd if=/sdcard/backupg3/boot.img of=/dev/block/platform/msm_sdcc.1/by-name/boot;
echo "Restaurando recovery.img";
dd  if=/sdcard/backupg3/recovery.img of=/dev/block/platform/msm_sdcc.1/by-name/recovery;
echo "Restaurando cache";
dd if=/sdcard/backupg3/cache.img of=/dev/block/platform/msm_sdcc.1/by-name/cache; 
echo "Restaurando Userdata.img";
dd if=/sdcard/backupg3/userdata.img of=/dev/block/platform/msm_sdcc.1/by-name/userdata;
echo "Restaurando System.img";
dd if=/sdcard/backupg3/system.img of=/dev/block/platform/msm_sdcc.1/by-name/system; 