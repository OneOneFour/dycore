cmake_minimum_required(VERSION 3.16)
project(dycore LANGUAGES Fortran C)

## SETUP INSTALL DIR
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/exec" CACHE PATH "..." FORCE)
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")


add_executable(dycore)
add_library(dycore_c)
add_executable(mppnccombine postprocessing/mppnccombine.c)

target_compile_definitions(dycore PRIVATE use_libMPI use_netCDF gFortran)

## FIND PACKAGES

# Find MPI
find_package(MPI REQUIRED)
target_link_libraries(dycore PRIVATE MPI::MPI_Fortran)


# Find NetCDF
find_package(NetCDF REQUIRED COMPONENTS C Fortran)
target_link_libraries(dycore PRIVATE NetCDF::NetCDF_Fortran NetCDF::NetCDF_C)
target_link_libraries(mppnccombine PRIVATE NetCDF::NetCDF_C)

# Find OpenMP
find_package (OpenMP REQUIRED COMPONENTS Fortran)
target_link_libraries(dycore PRIVATE OpenMP::OpenMP_Fortran )

if(NOT CMAKE_Fortran_COMPILER)
    set(CMAKE_Fortran_COMPILER "gfortran")
endif()


if(APPLE)
    message(STATUS "Configuring for MacOS")
    if(NOT CMAKE_C_COMPILER)
        set(CMAKE_C_COMPILER "clang")
    endif()
    set(CMAKE_OSX_ARCHITECTURES "arm64" CACHE STRING "Build architectures for MacOS")
endif()

if(NOT CMAKE_C_COMPILER)
    set(CMAKE_C_COMPILER "gcc")
endif()

## SET COMPILER SPECIFIC FLAGS
if(CMAKE_Fortran_COMPILER_ID  MATCHES "Intel|IntelLLVM")
    message(STATUS "Configuring for Intel Fortran")
    set( CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -i4 -r8 -fpp -fPIC")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
    message(STATUS "Configuring for GNU Fortran")
    set( CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -cpp -fallow-argument-mismatch -fbacktrace -fdefault-real-8 -fdefault-double-8 -fcray-pointer -fallow-invalid-boz -fno-range-check -ffree-line-length-none")
endif()


add_subdirectory(src/atmos_param)
add_subdirectory(src/atmos_shared)
add_subdirectory(src/atmos_solo)
add_subdirectory(src/atmos_spectral)
add_subdirectory(src/shared)
target_link_libraries(dycore PRIVATE dycore_c)