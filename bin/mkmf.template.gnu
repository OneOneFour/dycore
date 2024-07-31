CC=mpicc
FC=mpifort
LD=mpifort
CXX=mpicxx

FFLAGS=-g -O3 -fallow-argument-mismatch -fbacktrace -fdefault-real-8 -fdefault-double-8 -fcray-pointer -fallow-invalid-boz -fno-range-check -ffree-line-length-none -I/usr/lib/aarch64-linux-gnu/mpich/include -I/opt/netcdf-c/include -I/opt/hdf5/include -I/include -I/opt/netcdf-fortran/include -I/opt/udunits/include
CFLAGS=-pthread -g -O3 -Wall -Wno-unused-variable -Wno-unused-parameter -I/usr/lib/aarch64-linux-gnu/mpich/include -I/opt/netcdf-c/include -I/opt/hdf5/include -I/include -I/opt/netcdf-fortran/include -I/opt/udunits/include
LDFLAGS=-g -L/opt/netcdf-fortran/lib -lnetcdff -L/opt/netcdf-c/lib -lnetcdf -L/opt/udunits/lib -ludunits2