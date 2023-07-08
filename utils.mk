include config.mk

depscheck:
	@which ${CRYPTSETUP_BIN} blkid mkswap

podchecker:
	@podchecker *.pod

shellcheck:
	@shellcheck -s sh cryptmount.in

.PHONY: depscheck podchecker shellcheck
