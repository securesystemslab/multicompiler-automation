#!/bin/bash -e

if [ ! -d "llvm" ]; then
    ./fetch_multicompiler.sh

else
    ./git_pull.sh
fi

./patch_printf.sh

make install
