.POSIX:

include config.mk

all: cryptmount cryptmount.8 crypttab.5

%: %.pod
	pod2man -r "${NAME} ${VERSION}" -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

%: %.in
	sed -e "s/@CRYPTSETUP_BIN@/${CRYPTSETUP_BIN}/g" \
	    -e "s/@VERSION@/${VERSION}/g" $< > $@

install: all
	mkdir -p           ${DESTDIR}${PREFIX}/sbin
	mkdir -p           ${DESTDIR}${MANPREFIX}/man8
	mkdir -p           ${DESTDIR}${MANPREFIX}/man5
	cp -f cryptmount   ${DESTDIR}${PREFIX}/sbin/
	cp -f cryptmount.8 ${DESTDIR}${MANPREFIX}/man8/
	cp -f crypttab.5   ${DESTDIR}${MANPREFIX}/man5/
	chmod 0755         ${DESTDIR}${PREFIX}/sbin/cryptmount
	chmod 0644         ${DESTDIR}${MANPREFIX}/man8/cryptmount.8
	chmod 0644         ${DESTDIR}${MANPREFIX}/man5/crypttab.5

uninstall:
	rm -f ${DESTDIR}${PREFIX}/sbin/cryptmount
	rm -f ${DESTDIR}${MANPREFIX}/man8/cryptmount.8
	rm -f ${DESTDIR}${MANPREFIX}/man5/crypttab.5

clean:
	rm -f cryptmount cryptmount.8 crypttab.5

.PHONY: all install uninstall clean
