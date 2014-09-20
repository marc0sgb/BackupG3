#!/bin/sh

echo "Copia de modemst1.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/modemst1 of=/sdcard/backupg3/modemst1.img; 
echo "Copia de modemst2.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/modemst2 of=/sdcard/backupg3/modemst2.img;