.POSIX:

include config.mk

BIN8 = cryptmount
MAN5 = crypttab.5
MAN8 = cryptmount.8

all: cryptmount

cryptmount:
	cd src && sed "s/@VERSION@/${VERSION}/" $@.in > $@ && chmod 0755 $@

install: all
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	cd src && cp -f ${BIN8} ${DESTDIR}${PREFIX}/sbin
	cd man && cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5
	cd man && cp -f ${MAN8} ${DESTDIR}${MANPREFIX}/man8
	cd ${DESTDIR}${PREFIX}/sbin    && chmod 0755 ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && chmod 0644 ${MAN8}

uninstall:
	cd ${DESTDIR}${PREFIX}/sbin    && rm -f ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && rm -f ${MAN8}

clean:
	cd src && rm -f ${BIN8}
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all ${BIN8} install uninstall clean dist
