# multicompiler-automation
This is a toplevel project skeleton for automating building the Multicompiler. The make files and build scripts automate many of the tedious tasks required for building and autmating testing and deployment of the Multicompiler. Originally this began as a set of submodules, and later sub-repos and sub-trees, but due to the in-development nature of the Multicompiler, these methods became unwieldy. Until git provides a sane way to manage projects composed of many pieces, we're going to simply clone our subprojects directly. 

### Checkout the Multicompiler super project
`git clone -b no-submodules git@github.com:/ilovepi/multicompiler-automation.git multicompiler`

#### Clone LLVM, Clang, compiler-rt, poolalloc, and SVF into the Multicompiler project:

`git clone -b cfar_38 git@github.com:/securesystemslab/multicompiler-priv.git multicompiler/llvm`

`git clone -b cfar_38 git@github.com:/securesystemslab/multicompiler-clang-priv.git multicompiler/llvm/tools/clang`

`git clone -b cfar_38 git@github.com:/securesystemslab/multicompiler-compiler-rt-priv.git multicompiler/llvm/projects/compiler-rt`

`git clone -b cfar_38 git@github.com:/securesystemslab/poolalloc multicopilerllvm/projects/poolalloc`

`git clone git@github.com:/rboggild/SVF multicompiler/llvm/projects/svf`

### Ansible

A standalone ansible role will soon be availible for the Multicompiler. In the meantime you may use https://github.com/securesystemslab/vagrant-ansible-provisioning as a stand-in. That project builds the Multicompiler as part of the hypervisor, but it's playbooks can easily be adapted for stand-alone use with the multicompiler, by editing the bareflank_basics role, and the playbook.yml

These are all still WIP as these projects progress.
