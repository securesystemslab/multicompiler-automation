#!/bin/bash -e


git clone -b code_layout_rando_70 git@github.com:/securesystemslab/multicompiler-priv.git --depth 1 llvm

git clone -b code_layout_rando_70 git@github.com:/securesystemslab/multicompiler-clang-priv.git --depth 1 llvm/tools/clang

git clone -b code_layout_rando_70 git@github.com:securesystemslab/multicompiler-compiler-rt-priv.git --depth 1 llvm/projects/compiler-rt 
