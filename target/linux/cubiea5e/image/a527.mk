define Device/cubiea5e_a527
  KERNEL_NAME := Image
  DEVICE_VENDOR := Radxa
  DEVICE_MODEL := CubieA5E-a527
  DEVICE_DTS = allwinner/sun55i-radxa-cubie-a5e
  DEVICE_PACKAGES := kmod-mac80211 aic8800-firmware kmod-aic8800-bt kmod-aic8800-wlan
  IMAGE/sdcard.img.gz := syterkit-img | gzip | append-metadata
endef
TARGET_DEVICES += cubiea5e_a527
