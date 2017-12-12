#!/bin/bash -e

PREFIX=$1

mkdir -p llvm/build
pushd llvm/build
cmake .. -DLLVM_TARGETS_TO_BUILD="X86"            \
    -DCMAKE_INSTALL_PREFIX=$PREFIX                \
    -DCMAKE_BUILD_TYPE=Release                    \
    -DLLVM_BINUTILS_INCDIR=../../binutils/include \
    -DLLVM_BUILD_LLVM_DYLIB=On                    \
    -DLLVM_LINK_LLVM_DYLIB=On                     \
    -G Ninja
popd

