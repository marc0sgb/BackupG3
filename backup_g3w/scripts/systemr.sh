#!/bin/sh

echo "Restaurando system.img";
dd if=/sdcard/backupg3/system.img of=/dev/block/platform/msm_sdcc.1/by-name/system; 