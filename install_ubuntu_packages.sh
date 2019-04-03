#!/bin/bash -e

PACKAGES="
    autotools-dev       \
    bison               \
    build-essential     \
    bzip2               \
    cmake               \
    flex                \
    g++-5               \
    libpcre3-dev        \
    libssl1.0-dev       \
    libtool             \
    python              \
    ninja-build         \
    texinfo             "


echo $PACKAGES

sudo apt-get install -y $PACKAGES
