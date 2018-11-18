
HW  ?= qarm
APP ?= hello

include hw/$(HW).mk
include cpu/$(CPU).mk
include arch/$(ARCH).mk
include app/$(APP).mk

include versions.mk

.PHONY: all clean distclean buildroot

CWD		= $(CURDIR)
GZ		= $(HOME)/gz

WGET	= wget -c

all: buildroot

buildroot: buildroot/README
	cd $@ ; rm .config ; $(MAKE) allnoconfig ; cat \
		../all.buildroot \
		../hw/$(HW).buildroot \
		../cpu/$(CPU).buildroot \
		../arch/$(ARCH).buildroot \
		../app/$(APP).buildroot \
	>> .config && \
	echo "BR2_TARGET_GENERIC_HOSTNAME=\"$(HW)$(APP)\"" >> .config ;\
	$(MAKE) menuconfig && $(MAKE)
	
BUILDROOT_GIT = https://github.com/buildroot/buildroot.git
	
buildroot/README:
	git clone -b $(BUILDROOT_VER) --depth=1 $(BUILDROOT_GIT) buildroot
	ln -fs ../../package/Config.in buildroot/package/Config.in
	ln -fs ../../package/hello buildroot/package/hello
