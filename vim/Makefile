.POSIX:

include ../config.mk

all:

install:
	mkdir -p $(DESTDIR)$(VIMFILESDIR)/ftdetect
	mkdir -p $(DESTDIR)$(VIMFILESDIR)/syntax
	cp -f ftdetect/crypttab.vim $(DESTDIR)$(VIMFILESDIR)/ftdetect
	cp -f syntax/crypttab.vim $(DESTDIR)$(VIMFILESDIR)/syntax

uninstall:
	rm -f $(DESTDIR)$(VIMFILESDIR)/ftdetect/crypttab.vim
	rm -f $(DESTDIR)$(VIMFILESDIR)/syntax/crypttab.vim

clean:

.PHONY: all install uninstall clean
