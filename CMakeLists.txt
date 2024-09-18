cmake_minimum_required(VERSION 3.16)
project(dycore LANGUAGES Fortran C)

## SETUP INSTALL DIR
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/exec" CACHE PATH "..." FORCE)
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE)
endif()

add_executable(dycore)
add_library(dycore_c)
add_executable(mppnccombine postprocessing/mppnccombine.c)

target_compile_definitions(dycore PRIVATE use_libMPI use_netCDF gFortran)

## FIND PACKAGES

# Find MPI
find_package(MPI REQUIRED)
target_link_libraries(dycore PRIVATE MPI::MPI_Fortran)
target_link_libraries(dycore_c PRIVATE MPI::MPI_C)

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
if(MPI_Fortran_COMPILER)
    set(CMAKE_Fortran_COMPILER ${MPI_Fortran_COMPILER})
    message(STATUS "Using MPI Fortran compiler: ${MPI_Fortran_COMPILER}")   
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
    set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -xHost ${CMAKE_Fortran_FLAGS_RELEASE} ")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
    message(STATUS "Configuring for GNU Fortran")
    set( CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -cpp -fallow-argument-mismatch -fbacktrace -fdefault-real-8 -fdefault-double-8 -fcray-pointer -fallow-invalid-boz -fno-range-check -ffree-line-length-none")
    set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -march=native ${CMAKE_Fortran_FLAGS_RELEASE} ")
endif()

add_subdirectory(src/shared)
add_subdirectory(src/atmos_param)
add_subdirectory(src/atmos_shared)
add_subdirectory(src/atmos_solo)
add_subdirectory(src/atmos_spectral)

# file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)
# set_target_properties(dycore PROPERTIES Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)

# target_include_directories(dycore PRIVATE ${CMAKE_BINARY_DIR}/modules)

target_link_libraries(dycore PRIVATE dycore_c)
install(TARGETS dycore mppnccombine RUNTIME DESTINATION .) 
install(FILES input/hs_diag_table DESTINATION . RENAME diag_table)
install(FILES input/spectral_field_table DESTINATION . RENAME field_table)
install(DIRECTORY DESTINATION RESTART)
install(DIRECTORY DESTINATION INPUT)
install(FILES input/cg_drag_king_params.nc DESTINATION INPUT)
install(FILES input/input.spectral.nml DESTINATION . RENAME input.nml)  