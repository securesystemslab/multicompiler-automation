#!/bin/bash
# makefile for multi-compiler project

.PHONY: gold 

#llvm-cmake hypervisor-setup

all:

gold:
	pushd binutils;                                                                     \
	./configure --disable-werror --enable-plugins --enable-gold --prefix=$(pwd)/tools ; \
	popd
	#make ;                                                                              \
	#make install ;                                                                      \
	#popd
	#AC_CONFIG_SUBDIRS(binutils)
