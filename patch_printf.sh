#!/bin/bash -e

DO_PATCH=$(grep '__wur __THROW' /usr/include/printf.h)

if [[ 0 != $DO_PATCH ]]; then
    echo Patching /usr/include/printf.h ...
    sudo sed -i "s/\_\_wur \_\_THROW/\_\_THROW \_\_wur/" /usr/include/printf.h
fi
