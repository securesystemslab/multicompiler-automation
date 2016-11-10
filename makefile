# makefile for multi-compiler project

.PHONY: gold 

#llvm-cmake hypervisor-setup

all:

gold:
	AC_CONFIG_SUBDIRS([binutils])
