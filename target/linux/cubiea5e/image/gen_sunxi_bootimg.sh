#!/bin/bash
# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013 OpenWrt.org

set -ex
[ $# -eq 3 ] || {
    echo "SYNTAX: $0 <file> <kernel Image> <System Map>"
    exit 1
}


OUTPUT="$1"
BIMAGE="$2"
SYSMAP="$3"

BASE="0x40000000"
KERNEL_OFFSET="0x80000"

kernel_size=0
bss_section_size=0

DTB_OFFSET="0x0"

bss_start=0
bss_stop=0


kernel_size="`stat ${BIMAGE} --format="%s"`"

if [ -f $SYSMAP ]; then
    temp=`grep "__bss_start" $SYSMAP | awk '{print $1}'`
    bss_start=16#${temp: 0-7: 8}
    temp=`grep "__bss_stop" $SYSMAP | awk '{print $1}'`
    bss_stop=16#${temp: 0-7: 8}
    bss_section_size=$[$bss_stop - $bss_start]
fi

DTB_OFFSET=`printf "(%d+%d+%d+%d)/%d*%d\n" $KERNEL_OFFSET $kernel_size $bss_section_size 0x1fffff 0x100000 0x100000 | bc`

echo "Kernel Size -> ${kernel_size}"
echo "-- bss size -> ${bss_section_size}"
echo "DTB Offset  -> ${DTB_OFFSET}"


# you need to compile mkbootimg yourself or install via "apt install mkbootimg"
mkbootimg --kernel ${BIMAGE} \
        --board sun55i_arm64 \
        --base ${BASE} \
        --kernel_offset ${KERNEL_OFFSET} \
        --dtb ./sunxi-uboot/sunxi-ex.dtb \
        --dtb_offset ${DTB_OFFSET} \
        --header_version 2 \
        -o ${OUTPUT}