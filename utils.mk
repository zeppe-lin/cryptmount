include config.mk

GREPOPT = --exclude-dir=.git --exclude-dir=.github -R .
FINDOPT = -not \( -path "./.git*" -or -path ".*~" \)
MAXLINE = 80

urlcodes:
	@echo "=======> Check URLs for response code"
	@grep -Eiho "https?://[^\"\\'> ]+" ${GREPOPT} \
		| xargs -P10 -I{} curl -o /dev/null   \
		 -sw "[%{http_code}] %{url}\n" '{}'   \
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

longlines:
	@echo "=======> Check for long lines (> ${MAXLINE})"
	@find . -type f ${FINDOPT} -exec awk -v ML=${MAXLINE} \
		'length > ML { print FILENAME ":" FNR " " $$0 }'  {} \;

.PHONY: urlcodes depscheck podchecker shellcheck longlines
