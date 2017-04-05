# multicompiler-automation
This is a toplevel project skeleton for automating building the Multicompiler. The make files and build scripts automate many of the tedious tasks required for building and autmating testing and deployment of the Multicompiler. Originally this began as a set of submodules, and later sub-repos and sub-trees, but due to the in-development nature of the Multicompiler, these methods became unwieldy. Until git provides a sane way to manage projects composed of many pieces, we're going to simply clone our subprojects directly. 

## Installation

### Checkout the Multicompiler super project
`git clone -b no-submodules git@github.com:/ilovepi/multicompiler-automation.git multicompiler`

### Install dependancies (Ubuntu only), Patch printf.h, Clone the Multicompiler Sources, and Build the project
`./build.sh`

### Build the Multicompiler w/o other Installation steps
`make install`

### Update all Multicompiler Sources
`./git_pull.sh`

### Notes
These are all still WIP as these projects progress.
