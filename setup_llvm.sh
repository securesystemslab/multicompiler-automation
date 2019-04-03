#!/bin/bash -e

PREFIX="$1"

mkdir -p llvm/build
pushd llvm/build
cmake .. 
    -DCMAKE_C_COMPILER="/usr/bin/gcc-5"     \
    -DCMAKE_CXX_COMPILER="/usr/bin/g++-5"   \
    -DLLVM_TARGETS_TO_BUILD="X86"            \
    -DCMAKE_INSTALL_PREFIX="$PREFIX"                \
    -DCMAKE_BUILD_TYPE=Release                    \
    -DLLVM_BINUTILS_INCDIR=../../binutils/include \
    -G Ninja ;                                    \
popd

