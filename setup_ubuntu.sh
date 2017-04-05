#!/bin/bash -e

PACKGES=libssl-dev      \
    libpcre3-dev        \
    bzip2               \
    libtool             \
    autotools-dev       \
    build-essential     \
    bison               \
    ninja-build         \
    cmake               \
    texinfo

sudo apt-get install -y $PACKAGES
