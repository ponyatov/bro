
HW  ?= Qarm
APP ?= hello

include hw/$(HW).mk
include cpu/$(CPU).mk
include arch/$(ARCH).mk
include app/$(APP).mk

include versions.mk

include mk/buildroot.mk

.PHONY: all clean distclean buildroot

all: buildroot

buildroot: buildroot/README
buildroot/README:
	git clone -b $(BUILDROOT_VER) --depth=1 $(BUILDROOT_GIT) buildroot
