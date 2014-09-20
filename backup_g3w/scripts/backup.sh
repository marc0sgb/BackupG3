#!/bin/sh

echo "Copia de modem1.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/modemst1 of=/sdcard/backupg3/modemst1.img; 
echo "Copia de modem2.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/modemst2 of=/sdcard/backupg3/modemst2.img;
echo "Copia de boot.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/boot of=/sdcard/backupg3/boot.img;
echo "Copia de recovery.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/recovery of=/sdcard/backupg3/recovery.img;
echo "Copia de cache";
dd if=/dev/block/platform/msm_sdcc.1/by-name/cache of=/sdcard/backupg3/cache.img; 
echo "Copia de Userdata.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/userdata of=/sdcard/backupg3/userdata.img;
echo "Copia de system.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/system of=/sdcard/backupg3/system.img; 