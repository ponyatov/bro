################################################################################
#
# hello
#
################################################################################

HELLO_VERSION		= 0.0.1
HELLO_SITE_METHOD	= local
HELLO_SITE			= $(TOPDIR)/package/hello
HELLO_LICENSE		= GPL

define HELLO_CONFIGURE_CMDS
endef

define HELLO_BUILD_CMDS
	cd $(@D) ; $(TARGET_CONFIGURE_OPTS) $(MAKE) PREFIX=$(TARGET_DIR)/usr
endef

define HELLO_INSTALL_TARGET_CMDS
	cd $(@D) ; $(TARGET_CONFIGURE_OPTS) $(MAKE) PREFIX=$(TARGET_DIR)/usr install
endef

#define HELLO_PERMISSIONS
#	/usr/bin/hello*		f	0500	0	0	-	-	-	-	-
#endef

$(eval $(generic-package))
