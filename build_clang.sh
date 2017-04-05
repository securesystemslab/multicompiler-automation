#!/bin/bash -e

pushd llvm/build
ninja
ninja install
popd
