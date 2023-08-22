include config.mk

all: cryptmount cryptmount.8 crypttab.5

%: %.in
	sed "s/@VERSION@/${VERSION}/" $< > $@

%: %.pod
	pod2man -r "${NAME} ${VERSION}" -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

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
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall clean dist
