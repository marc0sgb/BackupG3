#!/bin/sh
echo "Restaurando modemst1.img";
dd if=/sdcard/backupg3/modemst1.img of=/dev/block/platform/msm_sdcc.1/by-name/modemst1;
echo "Restaurando modemst2.img";
dd if=/sdcard/backupg3/modemst2.img; of=/dev/block/platform/msm_sdcc.1/by-name/modemst2;