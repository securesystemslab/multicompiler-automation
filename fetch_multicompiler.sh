#!/bin/bash -e


git clone -b code_layout_rando_70 git@github.com:/securesystemslab/multicompiler-priv.git llvm

git clone -b code_layout_rando_70 git@github.com:/securesystemslab/multicompiler-clang-priv.git llvm/tools/clang

git clone -b code_layout_rando_70 git@github.com:securesystemslab/multicompiler-compiler-rt-priv.git