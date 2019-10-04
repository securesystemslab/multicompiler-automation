#!/bin/bash -e

PREFIX="$1"

mkdir -p llvm/build
pushd llvm/build
cmake .. -DCMAKE_C_COMPILER="/usr/bin/gcc-7"     \
    -DCMAKE_CXX_COMPILER="/usr/bin/g++-7"   \
    -DLLVM_TARGETS_TO_BUILD="X86"           	  \
    -DCMAKE_INSTALL_PREFIX="$PREFIX"              \
    -DCMAKE_BUILD_TYPE=Debug                    \
    -DLLVM_BINUTILS_INCDIR=../../binutils/include \
    -DCOMPILER_RT_BUILD_SANITIZERS=OFF          \
    -G Ninja ;                                    \
popd

