.POSIX:

include config.mk

all:

install: all
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	sed "s/@VERSION/${VERSION}/" cryptmount \
		> ${DESTDIR}${PREFIX}/sbin/cryptmount
	sed "s/^\.Os/.Os ${NAME} ${VERSION}/" crypttab.5 \
		> ${DESTDIR}${MANPREFIX}/man5/crypttab.5
	sed "s/^\.Os/.Os ${NAME} ${VERSION}/" cryptmount.8 \
		> ${DESTDIR}${MANPREFIX}/man8/cryptmount.8
	chmod 0755 ${DESTDIR}${PREFIX}/sbin/cryptmount
	chmod 0644 ${DESTDIR}${MANPREFIX}/man5/crypttab.5
	chmod 0644 ${DESTDIR}${MANPREFIX}/man8/cryptmount.8

uninstall:
	rm -f ${DESTDIR}${PREFIX}/sbin/cryptmount
	rm -f ${DESTDIR}${MANPREFIX}/man8/cryptmount.8
	rm -f ${DESTDIR}${MANPREFIX}/man5/crypttab.5

clean:
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall clean dist
