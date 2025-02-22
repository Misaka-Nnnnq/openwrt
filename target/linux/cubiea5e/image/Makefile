# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013 OpenWrt.org

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

DEVICE_VARS += UBOOT_DEVICE_NAME

# due to the lack of some functions in official u-boot now and some private data cannot't be decrypted so we just generate the files for lichee
define Build/syterkit-img

	./gen_sunxi_bootimg.sh ./boot.img \
		$(IMAGE_KERNEL) \
		$(LINUX_DIR)/System.map

	cp  $(IMAGE_ROOTFS) ./rootfs.ext4

	echo "WIP" > $@

endef

### Devices ###
define Device/Default
  PROFILES := Default
  KERNEL_NAME := Image
  KERNEL := kernel-bin
  IMAGES := sdcard.img.gz
endef

include $(SUBTARGET).mk

$(eval $(call BuildImage))