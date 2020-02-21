#!/bin/bash -e

pushd llvm/build
ninja llvm-tblgen 
ninja clang
ninja install
popd
