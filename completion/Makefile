.POSIX:

include ../config.mk

all:

lint:
	shellcheck -s bash bash_completion

install:
	mkdir -p $(DESTDIR)$(BASHCOMPDIR)
	cp -f bash_completion $(DESTDIR)$(BASHCOMPDIR)/cryptmount

uninstall:
	rm -f $(DESTDIR)$(BASHCOMPDIR)/cryptmount

clean:

.PHONY: all lint install uninstall clean
