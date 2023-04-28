## Dycore Apple Silicon Building

### Requirements
* homebrew
* MacOS SDK installed on system (preferably via XCode)


### Homebrew Requirements 
* hwloc
* mpich 
* netcdf
* netcdf-cxx
* netcdf-fortran
* gcc (i've only been able to get it working with gcc for now if LLVM has a fortran compiler for mac then by all means give it a shot)

To check `gcc` make sure to run `gcc-12 --version` in the command line and check it is actually calling gcc and `clang` (for some dumb reason macOS symlinks )

### Build

To build should 🤞 be a case of just executing `bash compilescript.sh` with the binary created with an directory called `exec.apple`. The building process should take no more than a few minutes to complete. 