# makefile for multi-compiler project

SHELL=/bin/bash

.PHONY: gold gold.config gold.build clang

#llvm-cmake hypervisor-setup
PREFIX=$(realpath tools)

all:

#@echo "Prefix = $(value PREFIX)"

install: gold.build gold.install clang.install

gold.install: gold.build
	$(MAKE) -C binutils install

clang.install: tools/bin/clang tools/bin/ld.old tools/lib/bfd-plugins


tools/bin/ld.old: tools/bin/ld.gold
	mv tools/bin/ld tools/bin/ld.old
	ln -s ld.gold tools/bin/ld

gold.build: gold.config
	$(MAKE) -C binutils

gold.config:
	pushd binutils ;                                    \
	./configure --disable-werror                        \
	--enable-plugins --enable-gold --prefix=$(PREFIX) ; \
	popd

llvm/build:
	mkdir llvm/build;                                 \
	pushd llvm/build;                                 \
	cmake .. -DLLVM_TARGETS_TO_BUILD="X86"            \
		-DCMAKE_INSTALL_PREFIX=$(PREFIX)              \
		-DCMAKE_BUILD_TYPE=Release                    \
		-DLLVM_BINUTILS_INCDIR=../../binutils/include \
		-G Ninja ;                                    \
	popd

tools/lib/bfd-plugins: tools/bin/clang tools/lib/LLVMgold.so
	mkdir tools/lib/bfd-plugins ; \
	touch tools/lib/bfd-plugins ; \
	ln -s ../LLVMgold.so tools/lib/bfd-plugins

tools/bin/clang: llvm/build
	pushd llvm/build; \
	ninja;            \
	ninja install;    \
	popd

clang: tools/lib/bfd-plugins

test: test.cpp
	./tools/bin/clang++ test.cpp -flto -Wl,--plugin-opt,-random-seed=10


clean_test:
	rm a.out

clean_llvm:
	rm -rf llvm/build

clean_install:
	rm -rf tools/*

clean: clean_test
