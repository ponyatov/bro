################################################################################
#
# belka
#
################################################################################

BELKA_VERSION		= 0.0.1
BELKA_SITE_METHOD	= local
BELKA_SITE			= $(TOPDIR)/package/belka

define BELKA_CONFIGURE_CMDS
endef

define BELKA_BUILD_CMDS
endef

define BELKA_INSTALL_TARGET_CMDS
endef

define BELKA_PERMISSIONS
endef

$(eval $(generic-package))
