# makefile for multi-compiler project

SHELL=/bin/bash

#.PHONY: clang

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

test: test.cpp
	./tools/bin/clang++ test.cpp -flto -Wl,--plugin-opt,-random-seed=10



test-2.o: test.cpp
        /var/lib/jenkins/jobs/Build-Hypervisor/workspace/17/project/hypervisor/build_scripts/x86_64-bareflank-clang++ -c test.cpp -o test-2.o -mllvm -shuffle-stack-frames 

test-2: test-2.o
        /var/lib/jenkins/jobs/Build-Hypervisor/workspace/17/project/hypervisor/build_scripts/x86_64-bareflank-clang++  test-2.o -flto -Wl,--plugin-opt,-random-seed=10

test-3.o: test.cpp
        ./tools/bin/clang++ -c test.cpp -o test-3.o -mllvm -shuffle-stack-frames 

test-3: test-3.o
        ./tools/bin/clang++  test-3.o -flto -Wl,--plugin-opt,-random-seed=10




clean_test:
	rm a.out test*.o

clean_llvm:
	rm -rf llvm/build

clean_install:
	rm -rf tools/*

clean: clean_test
