#!/bin/bash -e

pushd llvm/build
ninja
ninja check-llvm-tablegen 
ninja install
popd
