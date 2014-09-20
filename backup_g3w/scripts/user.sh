#!/bin/sh

echo "Copia de cache";
dd if=/dev/block/platform/msm_sdcc.1/by-name/cache of=/sdcard/backupg3/cache.img; 
echo "Copia de Userdata.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/userdata of=/sdcard/backupg3/userdata.img;