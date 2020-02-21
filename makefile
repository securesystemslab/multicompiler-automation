# makefile for multi-compiler project

#SHELL=/bin/bash

#.PHONY: clean

PREFIX="$(realpath tools)"

all:

install: clang.install

clang.install: tools/bin/clang

llvm/build:
	./setup_llvm.sh "$(PREFIX)"

tools/bin/clang: llvm/build
	./build_clang.sh

clean_llvm:
	rm -rf llvm/build

clean_install:
	rm -rf tools/*

