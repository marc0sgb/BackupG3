#!/bin/sh

echo "Restaurando Cache";
dd if=/sdcard/backupg3/cache.img of=/dev/block/platform/msm_sdcc.1/by-name/cache;  
echo "Restaurando Userdata.img";
dd if=/sdcard/backupg3/userdata.img of=/dev/block/platform/msm_sdcc.1/by-name/userdata; 