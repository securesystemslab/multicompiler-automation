# makefile for multi-compiler project

SHELL=/bin/bash

# .PHONY: clean

#llvm-cmake hypervisor-setup
PREFIX=$(realpath tools)

all:

#@echo "Prefix = $(value PREFIX)"

install: gold.install clang.install

gold.install: gold.build
	$(MAKE) -C binutils install

clang.install: tools/bin/clang tools/bin/ld.old tools/lib/bfd-plugins


tools/bin/ld.old: gold.install
	mv tools/bin/ld tools/bin/ld.old
	ln -sf ld.gold tools/bin/ld

gold.build: gold.config
	$(MAKE) -C binutils

gold.config: binutils/.binutils_configured

binutils/.binutils_configured:
	pushd binutils ;                                    \
	./configure --disable-werror                        \
	--enable-plugins --enable-gold --prefix=$(PREFIX) ; \
	touch .binutils_configured                          \
	popd

llvm/build:
	mkdir -p llvm/build;                              \
	pushd llvm/build;                                 \
	cmake .. -DLLVM_TARGETS_TO_BUILD="X86"            \
		-DCMAKE_INSTALL_PREFIX=$(PREFIX)              \
		-DCMAKE_BUILD_TYPE=Release                    \
		-DLLVM_BINUTILS_INCDIR=../../binutils/include \
		-G Ninja ;                                    \
	popd

tools/lib/bfd-plugins: tools/bin/clang gold.install
	mkdir -p tools/lib/bfd-plugins ;           \
		touch tools/lib/bfd-plugins ;          \
	ln -sf ../LLVMgold.so tools/lib/bfd-plugins

tools/bin/clang: llvm/build
	pushd llvm/build; \
	ninja;            \
	ninja install;    \
	popd

clang: tools/lib/bfd-plugins

clean_llvm:
	rm -rf llvm/build

clean_install:
	rm -rf tools/*

