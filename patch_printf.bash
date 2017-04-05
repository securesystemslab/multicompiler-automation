#!/bin/bash -e

echo Checking printf header compatability ...


if  grep -q '__wur __THROW' /usr/include/printf.h ; then
    echo Patching /usr/include/printf.h ...
    sudo sed -i "s/\_\_wur \_\_THROW/\_\_THROW \_\_wur/" /usr/include/printf.h
fi

echo printf header is patched.
