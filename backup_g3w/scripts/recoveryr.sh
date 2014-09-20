#!/bin/sh

echo "Restaurando recovery.img";
dd if=/sdcard/backupg3/recovery.img; of=/dev/block/platform/msm_sdcc.1/by-name/recovery 
