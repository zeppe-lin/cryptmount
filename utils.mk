include config.mk

deadlinks:
	@echo "=======> deadlinks"
	@grep -EIihor "https?://[^\"\\'> ]+" --exclude-dir=.git*  \
		| xargs -P10 -r -I{} curl -L -I -o/dev/null       \
		  -sw "[%{http_code}] %{url}\n" '{}'              \
		| grep -v '^\[200\]'                              \
		| sort -u

depscheck:
	@echo "=======> Check if any dependencies are missing"
	@which ${CRYPTSETUP_BIN} blkid mkswap

podchecker:
	@echo "=======> podchecker"
	@podchecker *.pod

shellcheck:
	@echo "=======> shellcheck"
	@shellcheck -s sh cryptmount.in

longlines:
	@echo "=======> longlines"
	@grep -PIrn '^.{81,}$$' --exclude-dir=.git* || :

.PHONY: deadlinks depscheck podchecker shellcheck longlines
