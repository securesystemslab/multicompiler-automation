# makefile for multi-compiler project

#SHELL=/bin/bash

#.PHONY: clean

#llvm-cmake hypervisor-setup
PREFIX="$(realpath tools)"

all:

#@echo "Prefix = $(value PREFIX)"

install: gold.install clang.install

gold.install: gold.build
	$(MAKE) -C binutils install

clang.install: tools/bin/clang tools/bin/ld.old tools/lib/bfd-plugins

tools/bin/ld.old: gold.install
	mv tools/bin/ld tools/bin/ld.old; \
	ln -sf ld.gold tools/bin/ld

gold.build: gold.config
	$(MAKE) -C binutils

gold.config: binutils/.binutils_configured

binutils/.binutils_configured:
	./configure_binutils.sh $(PREFIX)

llvm/build:
	./setup_llvm.sh $(PREFIX)

tools/lib/bfd-plugins: tools/bin/clang gold.install
	./create_bfd_plugins.sh

tools/bin/clang: llvm/build
	./build_clang.sh

clang: tools/lib/bfd-plugins

clean_llvm:
	rm -rf llvm/build

clean_install:
	rm -rf tools/*

