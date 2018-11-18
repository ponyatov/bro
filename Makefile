
HW  ?= Qarm
APP ?= hello

include hw/$(HW).mk
include app/$(APP).mk

include versions.mk

include mk/buildroot.mk

.PHONY: all clean distclean

all: buildroot

buildroot: $(BUILDROOT_VER)/README
$(BUILDROOT_VER)/README:
	git clone -b $(BUILDROOT_VER) --depth=1 $(BUILDROOT_GIT) buildroot
