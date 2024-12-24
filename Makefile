.POSIX:

include config.mk

all lint install uninstall clean:
	cd src && $(MAKE) $@
	cd man && $(MAKE) $@

.PHONY: all lint install uninstall clean
