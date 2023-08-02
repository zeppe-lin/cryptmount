include config.mk

all: deadlinks depscheck podchecker shellcheck longlines

deadlinks:
	@echo "=======> Check for dead links"
	@grep -EIihor "https?://[^\"\\'> ]+" --exclude-dir=.git*  \
		| xargs -P10 -r -I{} curl -L -I -o/dev/null       \
		  -sw "[%{http_code}] %{url}\n" '{}'              \
		| grep -v '^\[200\]'                              \
		| sort -u

depscheck:
	@echo "=======> Check if any dependencies are missing"
	@which ${CRYPTSETUP_BIN} blkid mkswap >/dev/null

podchecker:
	@echo "=======> Check PODs for syntax errors"
	@podchecker *.pod >/dev/null

shellcheck:
	@echo "=======> Check shell scripts for syntax errors"
	@shellcheck -s sh cryptmount.in

longlines:
	@echo "=======> Check for long lines"
	@! grep -PIrn '^.{81,}$$' --exclude-dir=.git*

.PHONY: all deadlinks depscheck podchecker shellcheck longlines
