################################################################################
#
# kiosk
#
################################################################################

KIOSK_VERSION		= 0.0.1
KIOSK_SITE_METHOD	= local
KIOSK_SITE			= $(TOPDIR)/package/kiosk
KIOSK_LICENSE		= GPL

define KIOSK_CONFIGURE_CMDS
endef

define KIOSK_BUILD_CMDS
endef

define KIOSK_INSTALL_TARGET_CMDS
	cp $(@D)/kiosk.py $(TARGET_DIR)/root/
	cp -r $(@D)/templates $(TARGET_DIR)/root/
	cp -r $(@D)/static $(TARGET_DIR)/root/
endef

define KIOSK_PERMISSIONS
	/root/kiosk.py		f	0500	0	0	-	-	-	-	-
endef

$(eval $(generic-package))
