#!/bin/bash -e

PREFIX="$1"

mkdir -p llvm/build
pushd llvm/build

# Current 7.0 Multicompiler only compiles with GCC 7.4
# Should be changed in the future.
cmake .. -DCMAKE_C_COMPILER="/usr/bin/gcc-7"     \
    -DCMAKE_CXX_COMPILER="/usr/bin/g++-7"   \
    -DLLVM_TARGETS_TO_BUILD="X86"           	  \
    -DCMAKE_INSTALL_PREFIX="$PREFIX"              \
    -DCMAKE_BUILD_TYPE=Release                    \
    -G Ninja ;                                    \
popd

