#/bin/bash -e


git clone -b cfar_38 git@github.com:/securesystemslab/multicompiler-priv.git llvm

git clone -b cfar_38 git@github.com:/securesystemslab/multicompiler-clang-priv.git llvm/tools/clang

git clone -b cfar_38 git@github.com:/securesystemslab/multicompiler-compiler-rt-priv.git llvm/projects/compiler-rt

git clone -b cfar_38 git@github.com:/securesystemslab/poolalloc llvm/projects/poolalloc

git clone git@github.com:/rboggild/SVF llvm/projects/svf
