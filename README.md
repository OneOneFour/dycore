# Dry Dynamical Core
By default builds the spectral dynamical core solver. There seems to be other code for solving on a B-Grid and solving the shallow water version of the system. 

Use CMake to build the project, tested and works on Sherlock (both GNU/Intel version) as well as on MacOS locally and within a docker container. 

## Compilation
First create CMake Build Files. To build for release (which enables hardware + code optimizations run):
```
cmake -S . -B build/ -DCMAKE_BUILD_TYPE=Release
cmake --build build/
cmake --install build/
```
In this mode, cmake will automatically detect the compilers that are available as well as the MPI + NetCDF libraries that are available. Manually setting the environment variables `NETCDF_Fortran_ROOT` and `NETCDF_C_ROOT` will help you out if CMake is not able to find NetCDF for some reason. 
After compilation + installation, an executable will be placed in a new directory called `exec` alongside the input fields needed to run the dynamical core. 

