#!/bin/bash 

echo Checking printf ...

DO_PATCH=$(grep -c '__wur __THROW' /usr/include/printf.h)

echo $DO_PATCH

if [ '0' != $DO_PATCH ]; then
    echo Patching /usr/include/printf.h ...
    sudo sed -i "s/\_\_wur \_\_THROW/\_\_THROW \_\_wur/" /usr/include/printf.h
fi

echo Complete
