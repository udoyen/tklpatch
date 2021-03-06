progname=$(shell awk '/^Source/ {print $$2}' debian/control)
prefix = /usr/local
INSTALL_PATH_BIN=$(prefix)/bin
INSTALL_PATH_SHARE=$(prefix)/share/$(progname)

all: usage

usage:
	@echo 'Usage: '
	@echo '    make install'
	@echo '    make uninstall'

install:
	mkdir -p $(INSTALL_PATH_BIN)
	mkdir -p $(INSTALL_PATH_SHARE)
	cp bin/* $(INSTALL_PATH_BIN)
	cp -a docs $(INSTALL_PATH_SHARE)
	cp -a examples $(INSTALL_PATH_SHARE)

uninstall:
	rm $(INSTALL_PATH_BIN)/$(progname)*
	rm -rf $(INSTALL_PATH_SHARE)

.PHONY: all usage install uninstall
