# AMD ISP4 Camera Driver
KVER ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KVER)/build
BASE_URL := https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/drivers/media/platform/amd/isp4

SRCS := isp4.c isp4_debug.c isp4_interface.c isp4_subdev.c isp4_video.c
HDRS := isp4.h isp4_debug.h isp4_interface.h isp4_subdev.h isp4_video.h isp4_fw_cmd_resp.h isp4_hw_reg.h
FILES := $(SRCS) $(HDRS)

obj-m += amd_capture.o
amd_capture-objs := isp4.o isp4_debug.o isp4_interface.o isp4_subdev.o isp4_video.o

all: $(FILES)
	$(MAKE) -C $(KDIR) M=$(PWD) modules

$(FILES):
	curl -sO $(BASE_URL)/$@

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
	depmod -a
	echo "amd_capture" > /etc/modules-load.d/amd-camera.conf
	modprobe amd_capture

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

distclean: clean
	rm -f $(FILES)

.PHONY: all install clean distclean
