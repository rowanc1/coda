
SYSPATH = /usr/local/bin
LOCALPATH = $(HOME)/coda/bin
EXE = coda

.PHONY: all help install uninstall test

all: help

help:
	@echo 'Usage: make COMMAND'
	@echo
	@echo 'Commands:'
	@echo '    help:       Display this message'
	@echo '    install:    Install coda'
	@echo '    uninstall:  Uninstall coda'
	@echo '    test:       Run automated tests'
	@echo

install:
	@if touch $(SYSPATH)/$(EXE) 2>/dev/null; then \
		cp $(EXE) $(SYSPATH)/; \
		chmod +x $(SYSPATH)/$(EXE); \
	else \
		mkdir -p $(LOCALPATH); \
		cp $(EXE) $(LOCALPATH)/; \
		chmod +x $(LOCALPATH)/$(EXE); \
	fi

uninstall:
	@if touch $(SYSPATH)/$(EXE); then \
		rm $(SYSPATH)/$(EXE); \
	else \
	    rm $(LOCALPATH)/$(EXE); \
	fi

test:
	cd tests && bash ./coda-test.sh
