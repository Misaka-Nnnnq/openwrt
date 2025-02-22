# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2014 OpenWrt.org

include $(TOPDIR)/rules.mk

BOARD:=cubiea5e
BOARDNAME:=Radxa Cubie A5E
FEATURES:=fpu usb ext4 boot-part rootfs-part rtc squashfs
SUBTARGETS:=a527

KERNEL_PATCHVER:=5.15

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools
DEFAULT_PACKAGES += partx-utils mkf2fs e2fsprogs blkid

$(eval $(call BuildTarget))
