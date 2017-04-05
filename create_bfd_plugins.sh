#!/bin/bash -e

mkdir -p tools/lib/bfd-plugins
touch tools/lib/bfd-plugins
ln -sf ../LLVMgold.so tools/lib/bfd-plugins

