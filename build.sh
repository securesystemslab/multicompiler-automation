#!/bin/bash -e

DISTRO=$(grep ^ID= /etc/os-release | cut -d'=' -f 2)

if [[ $DISTRO = 'ubuntu' ]]; then
    ./install_ubuntu_packages.sh
fi

if [ ! -d "llvm" ]; then
    ./fetch_multicompiler.sh

else
    ./git_pull.sh
fi

./patch_printf.sh

echo Building Multicompiler ...
make install
