#!/bin/bash -e

PACKAGES="libssl1.0-dev      \
    libpcre3-dev        \
    bzip2               \
    libtool             \
    autotools-dev       \
    build-essential     \
    bison               \
    ninja-build         \
    cmake               \
    texinfo"


echo $PACKAGES

sudo apt-get install -y $PACKAGES
