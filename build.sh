#!/bin/bash -e

if [ ! -d "llvm" ]; then
    ./fetch_multicompiler.sh

else
    echo 
    #./git_pull.sh
fi

./patch_printf.sh

echo Building Multicompiler ...
make install
