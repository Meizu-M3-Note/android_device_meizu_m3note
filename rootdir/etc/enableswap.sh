#!/bin/sh
echo 1073741824 > /sys/block/zram0/disksize
/system/bin/tiny_mkswap /dev/block/zram0
/system/bin/tiny_swapon /dev/block/zram0
