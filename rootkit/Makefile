KDIR ?= /lib/modules/$(shell uname -r)/build
all:
	CONFIG_MODULE_SIG=n
	$(MAKE) -C $(KDIR) M=$$PWD
clean:
	CONFIG_MODULE_SIG=n
	$(MAKE) -C $(KDIR) M=$$PWD clean
