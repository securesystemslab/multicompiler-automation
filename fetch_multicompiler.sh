#!/bin/bash -e


git clone -b cfar_70 git@github.com:/securesystemslab/multicompiler-priv.git llvm

git clone -b cfar_70 git@github.com:/securesystemslab/multicompiler-clang-priv.git llvm/tools/clang

git clone -b vtrando_70 git@github.com:securesystemslab/multicompiler-compiler-rt-priv.git 

git clone -b cfar_70 git@github.com:/securesystemslab/poolalloc-priv llvm/projects/poolalloc

git clone -b ubuntu18_04 git@github.com:/securesystemslab/binutils.git
