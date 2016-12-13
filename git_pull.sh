#!/bin/bash -e


function git_pull() {
    pushd $1
    git pull
    popd
}


git_pull binutils
git_pull llvm
git_pull llvm/tools/clang
git_pull llvm/projects/svf
git_pull llvm/projects/poolalloc
git_pull llvm/projects/compiler-rt
