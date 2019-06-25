#!/bin/bash -e

PACKAGES="
    autotools-dev       \
    bison               \
    build-essential     \
    bzip2               \
    cmake               \
    flex                \
    g++-4.8             \
    libpcre3-dev        \
    libssl1.0-dev       \
    libtool             \
    make		\
    python              \
    ninja-build         \
    texinfo             "


echo $PACKAGES

sudo apt-get install -y $PACKAGES
