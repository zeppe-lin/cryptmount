include config.mk

check_requirements:
	@which ${CRYPTSETUP_BIN} blkid mkswap

check_pods:
	@podchecker *.pod
