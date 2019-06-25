#!/bin/bash -e

pushd llvm/build
ninja llvm-tblgen 
ninja
ninja install
popd
