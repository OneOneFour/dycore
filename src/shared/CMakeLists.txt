target_sources(dycore PRIVATE 
    constants/constants.f90
    diag_manager/diag_axis.f90
    diag_manager/diag_manager.f90
    diag_manager/diag_output.f90
    fft/fft99.f90
    fft/fft.F90
    field_manager/field_manager.F90
    field_manager/parse.inc
    fms/fms.f90
    fms/fms_io.F90
    fms/read_data_2d.inc
    fms/read_data_3d.inc 
    fms/read_data_4d.inc 
    fms/write_data.inc 
    horiz_interp/horiz_interp.f90 
    memutils/memutils.F90 
    mpp/mpp_chksum.h
    mpp/mpp_chksum_int.h 
    mpp/mpp_domains.F90
    mpp/mpp.F90
    mpp/mpp_global_field.h
    mpp/mpp_global_reduce.h
    mpp/mpp_global_sum.h
    mpp/mpp_io.F90 
    mpp/mpp_read_2Ddecomp.h 
    mpp/mpp_reduce.h
    mpp/mpp_sum.h
    mpp/mpp_transmit.h
    mpp/mpp_update_domains2D.h
    mpp/mpp_write_2Ddecomp.h
    mpp/mpp_write.h
    mpp/os.h 
    platform/platform.F90
    time_manager/time_manager.f90
    topography/gaussian_topog.f90
    topography/topography.f90
    tracer_manager/tracer_manager.F90
)

target_include_directories(dycore PRIVATE 
    mpp/
)
target_sources (dycore_c PRIVATE
    memutils/memuse.c
    mpp/nsclock.c
)