#!/bin/sh

echo "Restaurando system.img";
dd if=/dev/block/platform/msm_sdcc.1/by-name/system of=/sdcard/backupg3/system.img; 