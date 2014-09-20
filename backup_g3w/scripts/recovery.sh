#!/bin/sh

echo "Copia de recovery.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/recovery of=/sdcard/backupg3/recovery.img;
