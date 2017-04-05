#!/bin/bash -e

PREFIX=$1

pushd binutils
./configure --disable-werror --enable-plugins --enable-gold --prefix=$PREFIX
touch .binutils_configured
popd

