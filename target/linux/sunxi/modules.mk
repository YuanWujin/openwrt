#
# Copyright (C) 2013-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

define KernelPackage/rtc-sunxi
    SUBMENU:=$(OTHER_MENU)
    TITLE:=Sunxi SoC built-in RTC support
    DEPENDS:=@TARGET_sunxi
    $(call AddDepends/rtc)
    KCONFIG:= \
	CONFIG_RTC_DRV_SUNXI \
	CONFIG_RTC_CLASS=y
    FILES:=$(LINUX_DIR)/drivers/rtc/rtc-sunxi.ko
    AUTOLOAD:=$(call AutoLoad,50,rtc-sunxi)
endef

define KernelPackage/rtc-sunxi/description
 Support for the AllWinner sunXi SoC's onboard RTC
endef

$(eval $(call KernelPackage,rtc-sunxi))

define KernelPackage/sunxi-ir
    SUBMENU:=$(OTHER_MENU)
    TITLE:=Sunxi SoC built-in IR support (A20)
    DEPENDS:=@TARGET_sunxi +kmod-input-core +evtest
    $(call AddDepends/rtc)
    KCONFIG:= \
	CONFIG_MEDIA_SUPPORT=y \
	CONFIG_MEDIA_RC_SUPPORT=y \
	CONFIG_RC_DEVICES=y \
	CONFIG_IR_SUNXI \
	CONFIG_RC_DECODERS=y \
	CONFIG_RC_CORE=m \
	CONFIG_LIRC=m \
	CONFIG_IR_NEC_DECODER=m \
	CONFIG_IR_RC5_DECODER=m \
	CONFIG_IR_RC6_DECODER=m \
	CONFIG_IR_JVC_DECODER=m \
	CONFIG_IR_SONY_DECODER=m \
	CONFIG_IR_SANYO_DECODER=m \
	CONFIG_IR_SHARP_DECODER=m \
	CONFIG_IR_MCE_KBD_DECODER=m \
	CONFIG_IR_LIRC_CODEC=y \
	CONFIG_IR_XMP_DECODER=m \
	CONFIG_IR_SPI=m \
	CONFIG_IR_GPIO_TX=m \
	CONFIG_IR_PWM_TX=m \
	CONFIG_IR_SERIAL=m \
	CONFIG_IR_SERIAL_TRANSMITTER=y \
	CONFIG_IR_SIR=m
    FILES:= \
	$(LINUX_DIR)/drivers/media/rc/sunxi-cir.ko \
	$(LINUX_DIR)/drivers/media/rc/rc-core.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-lirc-codec.ko \
	$(LINUX_DIR)/drivers/media/rc/lirc_dev.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-nec-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-rc5-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-rc6-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-jvc-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-sony-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-sanyo-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-sharp-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-mce_kbd-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-xmp-decoder.ko \
	$(LINUX_DIR)/drivers/media/rc/serial_ir.ko \
	$(LINUX_DIR)/drivers/media/rc/gpio-ir-tx.ko \
	$(LINUX_DIR)/drivers/media/rc/ir-spi.ko \
	$(LINUX_DIR)/drivers/media/rc/sir_ir.ko \
	$(LINUX_DIR)/drivers/media/rc/pwm-ir-tx.ko
    AUTOLOAD:=$(call AutoLoad,80,sunxi-cir)
endef

define KernelPackage/sunxi-ir/description
 Support for the AllWinner sunXi SoC's onboard IR (A20)
endef

$(eval $(call KernelPackage,sunxi-ir))


define KernelPackage/ata-sunxi
    TITLE:=AllWinner sunXi AHCI SATA support
    SUBMENU:=$(BLOCK_MENU)
    DEPENDS:=@TARGET_sunxi +kmod-ata-ahci-platform +kmod-scsi-core
    KCONFIG:=CONFIG_AHCI_SUNXI
    FILES:=$(LINUX_DIR)/drivers/ata/ahci_sunxi.ko
    AUTOLOAD:=$(call AutoLoad,41,ahci_sunxi,1)
endef

define KernelPackage/ata-sunxi/description
 SATA support for the AllWinner sunXi SoC's onboard AHCI SATA
endef

$(eval $(call KernelPackage,ata-sunxi))

define KernelPackage/sun4i-emac
  SUBMENU:=$(NETWORK_DEVICES_MENU)
  TITLE:=AllWinner EMAC Ethernet support
  DEPENDS:=@TARGET_sunxi +kmod-of-mdio +kmod-libphy
  KCONFIG:=CONFIG_SUN4I_EMAC
  FILES:=$(LINUX_DIR)/drivers/net/ethernet/allwinner/sun4i-emac.ko
  AUTOLOAD:=$(call AutoProbe,sun4i-emac)
endef

$(eval $(call KernelPackage,sun4i-emac))


define KernelPackage/sound-soc-sun4i-codec
  TITLE:=AllWinner built-in SoC sound support sun4i-codec
  KCONFIG:=CONFIG_SND_SUN4I_CODEC
  FILES:=$(LINUX_DIR)/sound/soc/sunxi/sun4i-codec.ko
  AUTOLOAD:=$(call AutoLoad,63,sun4i-codec)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sun4i-codec/description
  Kernel support for AllWinner built-in SoC audio sun4i-codec
endef

$(eval $(call KernelPackage,sound-soc-sun4i-codec))


define KernelPackage/sound-soc-sun8i-codec
  TITLE:=AllWinner SoC sound sun8i-codec
  KCONFIG:=CONFIG_SND_SUN8I_CODEC
  FILES:=$(LINUX_DIR)/sound/soc/sunxi/sun8i-codec.ko
  AUTOLOAD:=$(call AutoLoad,65,sun8i-codec)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sun8i-codec/description
  Kernel support for AllWinner built-in SoC audio sun8i-codec
endef

$(eval $(call KernelPackage,sound-soc-sun8i-codec))


define KernelPackage/sound-soc-sun8i-codec-analog
  TITLE:=AllWinner SoC sound sun8i-codec-analog
  KCONFIG:=CONFIG_SND_SUN8I_CODEC_ANALOG
  FILES:=$(LINUX_DIR)/sound/soc/sunxi/sun8i-codec-analog.ko
  AUTOLOAD:=$(call AutoLoad,67,sun8i-codec-analog)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sun8i-codec-analog/description
  Kernel support for AllWinner built-in SoC audio sun8i-codec-analog
endef

$(eval $(call KernelPackage,sound-soc-sun8i-codec-analog))


define KernelPackage/sound-soc-sun4i-i2s
  TITLE:=AllWinner SoC sound sun4i-i2s
  KCONFIG:=CONFIG_SND_SUN4I_I2S
  FILES:=$(LINUX_DIR)/sound/soc/sunxi/sun4i-i2s.ko
  AUTOLOAD:=$(call AutoLoad,67,sun4i-i2s)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sun4i-i2s/description
  Kernel support for AllWinner built-in SoC audio sun4i-i2s
endef

$(eval $(call KernelPackage,sound-soc-sun4i-i2s))


define KernelPackage/sound-soc-sun4i-spdif
  TITLE:=AllWinner SoC sound sun4i-spdif
  KCONFIG:=CONFIG_SND_SUN4I_SPDIF
  FILES:=$(LINUX_DIR)/sound/soc/sunxi/sun4i-spdif.ko
  AUTOLOAD:=$(call AutoLoad,67,sun4i-spdif)
  DEPENDS:=@TARGET_sunxi +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-sun4i-spdif/description
  Kernel support for AllWinner built-in SoC audio sun4i-spdif
endef

$(eval $(call KernelPackage,sound-soc-sun4i-spdif))

#####################################################

define KernelPackage/sun_graphics
  SUBMENU:=Graphics Support Sunxi
  TITLE:=AllWinner Graphics Support Sunxi
  DEPENDS:=@TARGET_sunxi
  KCONFIG:= \
	CONFIG_DRM=m \
	CONFIG_DRM_MIPI_DSI=y \
	CONFIG_DRM_KMS_HELPER=y \
	CONFIG_DRM_KMS_FB_HELPER=y \
	CONFIG_DRM_FBDEV_EMULATION=y \
	CONFIG_DRM_FBDEV_OVERALLOC=100 \
	CONFIG_DRM_LOAD_EDID_FIRMWARE=y \
	CONFIG_DRM_TTM=m \
	CONFIG_DRM_GEM_CMA_HELPER=y \
	CONFIG_DRM_KMS_CMA_HELPER=y \
	CONFIG_DRM_SCHED=m \
  FILES:= \
	$(LINUX_DIR)/drivers/gpu/drm/drm_kms_helper.ko \
	$(LINUX_DIR)/drivers/gpu/drm/drm.ko
  AUTOLOAD:=$(call AutoProbe,sun_graphics)
endef

$(eval $(call KernelPackage,sun_graphics))


define KernelPackage/sun_amd_library
  SUBMENU:=AMD Library routines
  TITLE:=AllWinner AMD Library routines
  DEPENDS:=@TARGET_sunxi
  KCONFIG:= \
	CONFIG_DRM_VKMS=m \
	CONFIG_DRM_RCAR_DW_HDMI=m \
	CONFIG_DRM_SUN4I=y \
	CONFIG_DRM_SUN4I_HDMI=y \
	CONFIG_DRM_SUN4I_HDMI_CEC=y \
	CONFIG_DRM_SUN4I_BACKEND=y \
	CONFIG_DRM_SUN6I_DSI=m \
	CONFIG_DRM_SUN8I_DW_HDMI=y \
	CONFIG_DRM_SUN8I_MIXER=y \
	CONFIG_DRM_SUN8I_TCON_TOP=y \
	CONFIG_DRM_PANEL=y
  FILES:= \
	$(LINUX_DIR)/drivers/gpu/drm/sun4i/sun4i_tv.ko \
	$(LINUX_DIR)/drivers/gpu/drm/sun4i/sun4i-drm.ko \
	$(LINUX_DIR)/drivers/gpu/drm/sun4i/sun6i_drc.ko \
	$(LINUX_DIR)/drivers/gpu/drm/sun4i/sun4i-tcon.ko \
	$(LINUX_DIR)/drivers/gpu/drm/sun4i/sun8i-mixer.ko \
	$(LINUX_DIR)/drivers/gpu/drm/sun4i/sun4i-backend.ko \
	$(LINUX_DIR)/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko \
	$(LINUX_DIR)/drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko
  AUTOLOAD:=$(call AutoProbe,sun_amd_library)
endef

$(eval $(call KernelPackage,sun_amd_library))
