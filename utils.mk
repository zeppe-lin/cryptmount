include config.mk

depscheck:
	@echo "=======> Check if any dependencies are missing"
	@which ${CRYPTSETUP_BIN} blkid mkswap

podchecker:
	@echo "=======> Check PODs for syntax errors"
	@podchecker *.pod

shellcheck:
	@echo "=======> Check shell scripts for syntax errors"
	@shellcheck -s sh cryptmount.in

.PHONY: depscheck podchecker shellcheck
