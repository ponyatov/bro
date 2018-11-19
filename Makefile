
HW  ?= qarm
APP ?= belka

include hw/$(HW).mk
include cpu/$(CPU).mk
include arch/$(ARCH).mk
include app/$(APP).mk

include versions.mk

.PHONY: all clean distclean buildroot

CWD		= $(CURDIR)
GZ		= $(HOME)/gz

WGET	= wget -c

NUM_CPUS ?= $(shell grep processor /proc/cpuinfo|wc -l)
MAX_CPUS ?= 4
ifeq ($(shell expr $(NUM_CPUS) \> $(MAX_CPUS)), 1)
NUM_CPUS = $(MAX_CPUS)
endif
 
MAKEJ	= make -j$(NUM_CPUS)

all: buildroot

KERNEL_FRAGMENT  = $(CWD)/hw/$(HW).kernel $(CWD)/cpu/$(CPU).kernel
KERNEL_FRAGMENT += $(CWD)/arch/$(ARCH).kernel $(CWD)/app/$(APP).kernel

buildroot: buildroot/README
	cd $@ ; rm .config ; $(MAKE) allnoconfig ; cat \
		../all.buildroot \
		../hw/$(HW).buildroot \
		../cpu/$(CPU).buildroot \
		../arch/$(ARCH).buildroot \
		../app/$(APP).buildroot \
	>> .config && \
	echo "BR2_TARGET_GENERIC_HOSTNAME=\"$(HW)$(APP)\"" >> .config ;\
	echo "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=\"$(CWD)/all.kernel\"" >> .config ;\
	echo "BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=\"$(KERNEL_FRAGMENT)\"" >> .config ;\
	$(MAKE) menuconfig && $(MAKEJ)
	
BUILDROOT_GIT = https://github.com/buildroot/buildroot.git
	
buildroot/README:
	git clone -b $(BUILDROOT_VER) --depth=1 $(BUILDROOT_GIT) buildroot
	ln -fs ../../package/Config.in buildroot/package/Config.in
	ln -fs ../../package/hello buildroot/package/hello
	ln -fs ../../package/gui   buildroot/package/gui
	ln -fs ../../package/flask buildroot/package/flask

KERNEL = buildroot/output/images/zImage
INITRD = buildroot/output/images/rootfs.cpio.gz
emu: $(KERNEL) $(INITRD)
	$(QEMU) -serial mon:stdio \
		-kernel $(KERNEL) -initrd $(INITRD) -append $(QEMU_CMDLINE)
		
doxy:
	rm -rf docs ; doxygen doxy.gen 1>/dev/null
