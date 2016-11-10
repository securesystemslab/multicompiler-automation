# makefile for multi-compiler project
shell=/bin/bash

.PHONY: gold gold.config gold.build

#llvm-cmake hypervisor-setup
PREFIX=$(realpath tools)

all:

install: gold.build
	$(MAKE) -C binutils install


gold.build: gold.config
	$(MAKE) -C binutils


gold.config:
	pushd binutils ; \
	./configure --disable-werror --enable-plugins --enable-gold --prefix=$(PREFIX) ; \
	popd

	#make ;                                                                              \
	#make install ;                                                                      \
	#popd
