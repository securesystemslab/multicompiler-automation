#!/bin/bash -e


git clone -b cfar_70 git@github.com:/securesystemslab/multicompiler-priv.git llvm

git clone -b cfar_70 git@github.com:/securesystemslab/multicompiler-clang-priv.git llvm/tools/clang

git clone -b release_70 git@github.com:llvm-mirror/compiler-rt.git llvm/projects/compiler-rt

git clone -b cfar_70 git@github.com:/securesystemslab/poolalloc-priv llvm/projects/poolalloc

git clone -b ubuntu18_04 git@github.com:/securesystemslab/binutils.git
