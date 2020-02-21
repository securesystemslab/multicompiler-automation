#!/bin/bash -e

DISTRO=$(grep ^ID= /etc/os-release | cut -d'=' -f 2)

if [[ $DISTRO = 'ubuntu' ]]; then
    ./install_ubuntu_packages.sh
fi

echo Building Multicompiler ...
make install
