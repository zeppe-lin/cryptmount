include config.mk

GREP_DEFS = --exclude-dir=.git --exclude-dir=.github -R .

urlcodes:
	@echo "=======> Check URLs for response code"
	@grep -Eiho "https?://[^\"\\'> ]+" ${GREP_DEFS} \
		| xargs -P10 -I{} curl -o /dev/null     \
		 -sw "[%{http_code}] %{url}\n" '{}'     \
		| sort -u

depscheck:
	@echo "=======> Check if any dependencies are missing"
	@which ${CRYPTSETUP_BIN} blkid mkswap

podchecker:
	@echo "=======> Check PODs for syntax errors"
	@podchecker *.pod

shellcheck:
	@echo "=======> Check shell scripts for syntax errors"
	@shellcheck -s sh cryptmount.in

.PHONY: urlcodes depscheck podchecker shellcheck
