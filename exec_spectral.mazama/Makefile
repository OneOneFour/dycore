# Makefile created by mkmf $Id: mkmf,v 10.0 2003/10/27 23:31:04 arl Exp $ 

include /scratch/myoder96/dycore/bin/mkmf.template.mazama

CPPDEFS = -Duse_libMPI -Duse_netCDF

.DEFAULT:
	-touch $@
all: fms.x
time_manager.o: /scratch/myoder96/dycore/src/shared/time_manager/time_manager.f90 fms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/time_manager/time_manager.f90
spherical_fourier.o: /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical_fourier.f90 fms.o mpp.o mpp_domains.o constants.o spec_mpp.o spherical.o gauss_and_legendre.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/tools/spherical_fourier.f90
spectral_dynamics.o: /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_dynamics.f90 fms.o constants.o time_manager.o field_manager.o tracer_manager.o diag_manager.o transforms.o vert_advection.o implicit.o press_and_geopot.o spectral_damping.o leapfrog.o fv_advection.o water_borrowing.o global_integral.o spectral_init_cond.o tracer_type.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/spectral_dynamics.f90
vert_advection.o: /scratch/myoder96/dycore/src/atmos_shared/vert_advection/vert_advection.f90 fms.o mpp.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_shared/vert_advection/vert_advection.f90
atmos_model.o: /scratch/myoder96/dycore/src/atmos_solo/atmos_model.f90 atmosphere.o time_manager.o fms.o fms_io.o constants.o mpp_io.o diag_manager.o field_manager.o tracer_manager.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_solo/atmos_model.f90
mpp_io.o: /scratch/myoder96/dycore/src/shared/mpp/mpp_io.F90 /scratch/myoder96/dycore/src/shared/mpp/os.h /scratch/myoder96/dycore/src/shared/mpp/mpp_write_2Ddecomp.h /scratch/myoder96/dycore/src/shared/mpp/mpp_write.h /scratch/myoder96/dycore/src/shared/mpp/mpp_read_2Ddecomp.h mpp.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/scratch/myoder96/dycore/src/shared/mpp	/scratch/myoder96/dycore/src/shared/mpp/mpp_io.F90
atmosphere.o: /scratch/myoder96/dycore/src/atmos_spectral/driver/solo/atmosphere.f90 fms.o constants.o transforms.o time_manager.o press_and_geopot.o spectral_dynamics.o tracer_type.o hs_forcing.o field_manager.o tracer_manager.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/driver/solo/atmosphere.f90
fms_io.o: /scratch/myoder96/dycore/src/shared/fms/fms_io.F90 /scratch/myoder96/dycore/src/shared/fms/read_data_2d.inc /scratch/myoder96/dycore/src/shared/fms/read_data_3d.inc /scratch/myoder96/dycore/src/shared/fms/read_data_4d.inc /scratch/myoder96/dycore/src/shared/fms/write_data.inc mpp_io.o mpp_domains.o mpp.o platform.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/scratch/myoder96/dycore/src/shared/fms	/scratch/myoder96/dycore/src/shared/fms/fms_io.F90
tracer_manager.o: /scratch/myoder96/dycore/src/shared/tracer_manager/tracer_manager.F90 mpp.o mpp_io.o fms.o field_manager.o mpp_domains.o diag_manager.o time_manager.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/tracer_manager/tracer_manager.F90
topography.o: /scratch/myoder96/dycore/src/shared/topography/topography.f90 gaussian_topog.o horiz_interp.o fms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/topography/topography.f90
spectral_damping.o: /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_damping.f90 fms.o transforms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/spectral_damping.f90
horiz_interp.o: /scratch/myoder96/dycore/src/shared/horiz_interp/horiz_interp.f90 fms.o mpp.o constants.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/horiz_interp/horiz_interp.f90
spectral_initialize_fields.o: /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_initialize_fields.f90 fms.o constants.o transforms.o mpp.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/init/spectral_initialize_fields.f90
fft.o: /scratch/myoder96/dycore/src/shared/fft/fft.F90 platform.o fms.o fft99.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/fft/fft.F90
memuse.o: /scratch/myoder96/dycore/src/shared/memutils/memuse.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) -c	/scratch/myoder96/dycore/src/shared/memutils/memuse.c
memutils.o: /scratch/myoder96/dycore/src/shared/memutils/memutils.F90 mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/memutils/memutils.F90
gaussian_topog.o: /scratch/myoder96/dycore/src/shared/topography/gaussian_topog.f90 fms.o constants.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/topography/gaussian_topog.f90
implicit.o: /scratch/myoder96/dycore/src/atmos_spectral/model/implicit.f90 fms.o constants.o press_and_geopot.o matrix_invert.o transforms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/implicit.f90
matrix_invert.o: /scratch/myoder96/dycore/src/atmos_spectral/model/matrix_invert.f90 fms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/matrix_invert.f90
diag_axis.o: /scratch/myoder96/dycore/src/shared/diag_manager/diag_axis.f90 mpp_domains.o fms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/diag_manager/diag_axis.f90
hs_forcing.o: /scratch/myoder96/dycore/src/atmos_param/hs_forcing/hs_forcing.f90 constants.o fms.o time_manager.o diag_manager.o field_manager.o tracer_manager.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_param/hs_forcing/hs_forcing.f90
diag_manager.o: /scratch/myoder96/dycore/src/shared/diag_manager/diag_manager.f90 time_manager.o mpp_io.o fms.o mpp.o diag_axis.o diag_output.o mpp_domains.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/diag_manager/diag_manager.f90
vert_coordinate.o: /scratch/myoder96/dycore/src/atmos_spectral/init/vert_coordinate.f90 fms.o constants.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/init/vert_coordinate.f90
transforms.o: /scratch/myoder96/dycore/src/atmos_spectral/tools/transforms.f90 fms.o mpp.o mpp_domains.o spec_mpp.o constants.o spherical_fourier.o grid_fourier.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/tools/transforms.f90
spherical.o: /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical.f90 fms.o spec_mpp.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/tools/spherical.f90
constants.o: /scratch/myoder96/dycore/src/shared/constants/constants.f90 fms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/constants/constants.f90
tracer_type.o: /scratch/myoder96/dycore/src/atmos_spectral/model/tracer_type.f90
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/tracer_type.f90
fms.o: /scratch/myoder96/dycore/src/shared/fms/fms.f90 mpp.o mpp_domains.o mpp_io.o fms_io.o memutils.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/fms/fms.f90
spec_mpp.o: /scratch/myoder96/dycore/src/atmos_spectral/tools/spec_mpp.f90 fms.o mpp_domains.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/tools/spec_mpp.f90
grid_fourier.o: /scratch/myoder96/dycore/src/atmos_spectral/tools/grid_fourier.f90 fms.o constants.o fft.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/tools/grid_fourier.f90
field_manager.o: /scratch/myoder96/dycore/src/shared/field_manager/field_manager.F90 /scratch/myoder96/dycore/src/shared/field_manager/parse.inc mpp.o mpp_io.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/scratch/myoder96/dycore/src/shared/field_manager	/scratch/myoder96/dycore/src/shared/field_manager/field_manager.F90
diag_output.o: /scratch/myoder96/dycore/src/shared/diag_manager/diag_output.f90 mpp_io.o mpp_domains.o mpp.o diag_axis.o time_manager.o fms.o platform.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/diag_manager/diag_output.f90
gauss_and_legendre.o: /scratch/myoder96/dycore/src/atmos_spectral/tools/gauss_and_legendre.f90 fms.o constants.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/tools/gauss_and_legendre.f90
nsclock.o: /scratch/myoder96/dycore/src/shared/mpp/nsclock.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) -c	/scratch/myoder96/dycore/src/shared/mpp/nsclock.c
leapfrog.o: /scratch/myoder96/dycore/src/atmos_spectral/model/leapfrog.f90 fms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/leapfrog.f90
global_integral.o: /scratch/myoder96/dycore/src/atmos_spectral/model/global_integral.f90 fms.o press_and_geopot.o transforms.o constants.o mpp_domains.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/global_integral.f90
topog_regularization.o: /scratch/myoder96/dycore/src/atmos_spectral/init/topog_regularization.f90 fms.o mpp.o constants.o transforms.o mpp_domains.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/init/topog_regularization.f90
platform.o: /scratch/myoder96/dycore/src/shared/platform/platform.F90 /scratch/myoder96/dycore/src/shared/mpp/os.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/scratch/myoder96/dycore/src/shared/mpp	/scratch/myoder96/dycore/src/shared/platform/platform.F90
mpp.o: /scratch/myoder96/dycore/src/shared/mpp/mpp.F90 /scratch/myoder96/dycore/src/shared/mpp/os.h /scratch/myoder96/dycore/src/shared/mpp/mpp_transmit.h /scratch/myoder96/dycore/src/shared/mpp/mpp_reduce.h /scratch/myoder96/dycore/src/shared/mpp/mpp_sum.h /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum_int.h /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/scratch/myoder96/dycore/src/shared/mpp	/scratch/myoder96/dycore/src/shared/mpp/mpp.F90
fv_advection.o: /scratch/myoder96/dycore/src/atmos_spectral/model/fv_advection.f90 fms.o constants.o mpp_domains.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/fv_advection.f90
press_and_geopot.o: /scratch/myoder96/dycore/src/atmos_spectral/model/press_and_geopot.f90 fms.o constants.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/press_and_geopot.f90
fft99.o: /scratch/myoder96/dycore/src/shared/fft/fft99.f90 constants.o mpp.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/shared/fft/fft99.f90
mpp_domains.o: /scratch/myoder96/dycore/src/shared/mpp/mpp_domains.F90 /scratch/myoder96/dycore/src/shared/mpp/os.h /scratch/myoder96/dycore/src/shared/mpp/mpp_update_domains2D.h /scratch/myoder96/dycore/src/shared/mpp/mpp_global_reduce.h /scratch/myoder96/dycore/src/shared/mpp/mpp_global_sum.h /scratch/myoder96/dycore/src/shared/mpp/mpp_global_field.h mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/scratch/myoder96/dycore/src/shared/mpp	/scratch/myoder96/dycore/src/shared/mpp/mpp_domains.F90
water_borrowing.o: /scratch/myoder96/dycore/src/atmos_spectral/model/water_borrowing.f90 fms.o transforms.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/model/water_borrowing.f90
spectral_init_cond.o: /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_init_cond.f90 fms.o mpp.o mpp_domains.o constants.o vert_coordinate.o transforms.o press_and_geopot.o spectral_initialize_fields.o topog_regularization.o topography.o
	$(FC) $(FFLAGS) -c	/scratch/myoder96/dycore/src/atmos_spectral/init/spectral_init_cond.f90
./mpp_domains.F90: /scratch/myoder96/dycore/src/shared/mpp/mpp_domains.F90
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_domains.F90 .
./mpp_reduce.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_reduce.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_reduce.h .
./gauss_and_legendre.f90: /scratch/myoder96/dycore/src/atmos_spectral/tools/gauss_and_legendre.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/tools/gauss_and_legendre.f90 .
./parse.inc: /scratch/myoder96/dycore/src/shared/field_manager/parse.inc
	cp /scratch/myoder96/dycore/src/shared/field_manager/parse.inc .
./spherical.f90: /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical.f90 .
./read_data_4d.inc: /scratch/myoder96/dycore/src/shared/fms/read_data_4d.inc
	cp /scratch/myoder96/dycore/src/shared/fms/read_data_4d.inc .
./atmosphere.f90: /scratch/myoder96/dycore/src/atmos_spectral/driver/solo/atmosphere.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/driver/solo/atmosphere.f90 .
./fms.f90: /scratch/myoder96/dycore/src/shared/fms/fms.f90
	cp /scratch/myoder96/dycore/src/shared/fms/fms.f90 .
./fft.F90: /scratch/myoder96/dycore/src/shared/fft/fft.F90
	cp /scratch/myoder96/dycore/src/shared/fft/fft.F90 .
./diag_axis.f90: /scratch/myoder96/dycore/src/shared/diag_manager/diag_axis.f90
	cp /scratch/myoder96/dycore/src/shared/diag_manager/diag_axis.f90 .
./spectral_initialize_fields.f90: /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_initialize_fields.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_initialize_fields.f90 .
./field_manager.F90: /scratch/myoder96/dycore/src/shared/field_manager/field_manager.F90
	cp /scratch/myoder96/dycore/src/shared/field_manager/field_manager.F90 .
./matrix_invert.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/matrix_invert.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/matrix_invert.f90 .
./write_data.inc: /scratch/myoder96/dycore/src/shared/fms/write_data.inc
	cp /scratch/myoder96/dycore/src/shared/fms/write_data.inc .
./memutils.F90: /scratch/myoder96/dycore/src/shared/memutils/memutils.F90
	cp /scratch/myoder96/dycore/src/shared/memutils/memutils.F90 .
./read_data_3d.inc: /scratch/myoder96/dycore/src/shared/fms/read_data_3d.inc
	cp /scratch/myoder96/dycore/src/shared/fms/read_data_3d.inc .
./diag_manager.f90: /scratch/myoder96/dycore/src/shared/diag_manager/diag_manager.f90
	cp /scratch/myoder96/dycore/src/shared/diag_manager/diag_manager.f90 .
./read_data_2d.inc: /scratch/myoder96/dycore/src/shared/fms/read_data_2d.inc
	cp /scratch/myoder96/dycore/src/shared/fms/read_data_2d.inc .
./fms_io.F90: /scratch/myoder96/dycore/src/shared/fms/fms_io.F90
	cp /scratch/myoder96/dycore/src/shared/fms/fms_io.F90 .
./time_manager.f90: /scratch/myoder96/dycore/src/shared/time_manager/time_manager.f90
	cp /scratch/myoder96/dycore/src/shared/time_manager/time_manager.f90 .
./fv_advection.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/fv_advection.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/fv_advection.f90 .
./hs_forcing.f90: /scratch/myoder96/dycore/src/atmos_param/hs_forcing/hs_forcing.f90
	cp /scratch/myoder96/dycore/src/atmos_param/hs_forcing/hs_forcing.f90 .
./atmos_model.f90: /scratch/myoder96/dycore/src/atmos_solo/atmos_model.f90
	cp /scratch/myoder96/dycore/src/atmos_solo/atmos_model.f90 .
./mpp_chksum.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum.h .
./os.h: /scratch/myoder96/dycore/src/shared/mpp/os.h
	cp /scratch/myoder96/dycore/src/shared/mpp/os.h .
./mpp_chksum_int.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum_int.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum_int.h .
./mpp_sum.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_sum.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_sum.h .
./diag_output.f90: /scratch/myoder96/dycore/src/shared/diag_manager/diag_output.f90
	cp /scratch/myoder96/dycore/src/shared/diag_manager/diag_output.f90 .
./mpp_io.F90: /scratch/myoder96/dycore/src/shared/mpp/mpp_io.F90
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_io.F90 .
./mpp_update_domains2D.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_update_domains2D.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_update_domains2D.h .
./mpp.F90: /scratch/myoder96/dycore/src/shared/mpp/mpp.F90
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp.F90 .
./mpp_write.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_write.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_write.h .
./implicit.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/implicit.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/implicit.f90 .
./mpp_global_sum.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_global_sum.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_global_sum.h .
./topography.f90: /scratch/myoder96/dycore/src/shared/topography/topography.f90
	cp /scratch/myoder96/dycore/src/shared/topography/topography.f90 .
./press_and_geopot.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/press_and_geopot.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/press_and_geopot.f90 .
./horiz_interp.f90: /scratch/myoder96/dycore/src/shared/horiz_interp/horiz_interp.f90
	cp /scratch/myoder96/dycore/src/shared/horiz_interp/horiz_interp.f90 .
./spec_mpp.f90: /scratch/myoder96/dycore/src/atmos_spectral/tools/spec_mpp.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/tools/spec_mpp.f90 .
./vert_coordinate.f90: /scratch/myoder96/dycore/src/atmos_spectral/init/vert_coordinate.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/init/vert_coordinate.f90 .
./tracer_type.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/tracer_type.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/tracer_type.f90 .
./memuse.c: /scratch/myoder96/dycore/src/shared/memutils/memuse.c
	cp /scratch/myoder96/dycore/src/shared/memutils/memuse.c .
./leapfrog.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/leapfrog.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/leapfrog.f90 .
./spherical_fourier.f90: /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical_fourier.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical_fourier.f90 .
./tracer_manager.F90: /scratch/myoder96/dycore/src/shared/tracer_manager/tracer_manager.F90
	cp /scratch/myoder96/dycore/src/shared/tracer_manager/tracer_manager.F90 .
./water_borrowing.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/water_borrowing.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/water_borrowing.f90 .
./grid_fourier.f90: /scratch/myoder96/dycore/src/atmos_spectral/tools/grid_fourier.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/tools/grid_fourier.f90 .
./fft99.f90: /scratch/myoder96/dycore/src/shared/fft/fft99.f90
	cp /scratch/myoder96/dycore/src/shared/fft/fft99.f90 .
./mpp_write_2Ddecomp.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_write_2Ddecomp.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_write_2Ddecomp.h .
./global_integral.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/global_integral.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/global_integral.f90 .
./mpp_read_2Ddecomp.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_read_2Ddecomp.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_read_2Ddecomp.h .
./topog_regularization.f90: /scratch/myoder96/dycore/src/atmos_spectral/init/topog_regularization.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/init/topog_regularization.f90 .
./vert_advection.f90: /scratch/myoder96/dycore/src/atmos_shared/vert_advection/vert_advection.f90
	cp /scratch/myoder96/dycore/src/atmos_shared/vert_advection/vert_advection.f90 .
./spectral_damping.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_damping.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_damping.f90 .
./mpp_transmit.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_transmit.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_transmit.h .
./nsclock.c: /scratch/myoder96/dycore/src/shared/mpp/nsclock.c
	cp /scratch/myoder96/dycore/src/shared/mpp/nsclock.c .
./gaussian_topog.f90: /scratch/myoder96/dycore/src/shared/topography/gaussian_topog.f90
	cp /scratch/myoder96/dycore/src/shared/topography/gaussian_topog.f90 .
./mpp_global_reduce.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_global_reduce.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_global_reduce.h .
./transforms.f90: /scratch/myoder96/dycore/src/atmos_spectral/tools/transforms.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/tools/transforms.f90 .
./platform.F90: /scratch/myoder96/dycore/src/shared/platform/platform.F90
	cp /scratch/myoder96/dycore/src/shared/platform/platform.F90 .
./mpp_global_field.h: /scratch/myoder96/dycore/src/shared/mpp/mpp_global_field.h
	cp /scratch/myoder96/dycore/src/shared/mpp/mpp_global_field.h .
./spectral_init_cond.f90: /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_init_cond.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_init_cond.f90 .
./spectral_dynamics.f90: /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_dynamics.f90
	cp /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_dynamics.f90 .
./constants.f90: /scratch/myoder96/dycore/src/shared/constants/constants.f90
	cp /scratch/myoder96/dycore/src/shared/constants/constants.f90 .
SRC = /scratch/myoder96/dycore/src/shared/time_manager/time_manager.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical_fourier.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_dynamics.f90 /scratch/myoder96/dycore/src/atmos_shared/vert_advection/vert_advection.f90 /scratch/myoder96/dycore/src/atmos_solo/atmos_model.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_io.F90 /scratch/myoder96/dycore/src/atmos_spectral/driver/solo/atmosphere.f90 /scratch/myoder96/dycore/src/shared/fms/fms_io.F90 /scratch/myoder96/dycore/src/shared/tracer_manager/tracer_manager.F90 /scratch/myoder96/dycore/src/shared/topography/topography.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_damping.f90 /scratch/myoder96/dycore/src/shared/horiz_interp/horiz_interp.f90 /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_initialize_fields.f90 /scratch/myoder96/dycore/src/shared/fft/fft.F90 /scratch/myoder96/dycore/src/shared/memutils/memuse.c /scratch/myoder96/dycore/src/shared/memutils/memutils.F90 /scratch/myoder96/dycore/src/shared/topography/gaussian_topog.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/implicit.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/matrix_invert.f90 /scratch/myoder96/dycore/src/shared/diag_manager/diag_axis.f90 /scratch/myoder96/dycore/src/atmos_param/hs_forcing/hs_forcing.f90 /scratch/myoder96/dycore/src/shared/diag_manager/diag_manager.f90 /scratch/myoder96/dycore/src/atmos_spectral/init/vert_coordinate.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/transforms.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical.f90 /scratch/myoder96/dycore/src/shared/constants/constants.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/tracer_type.f90 /scratch/myoder96/dycore/src/shared/fms/fms.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/spec_mpp.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/grid_fourier.f90 /scratch/myoder96/dycore/src/shared/field_manager/field_manager.F90 /scratch/myoder96/dycore/src/shared/diag_manager/diag_output.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/gauss_and_legendre.f90 /scratch/myoder96/dycore/src/shared/mpp/nsclock.c /scratch/myoder96/dycore/src/atmos_spectral/model/leapfrog.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/global_integral.f90 /scratch/myoder96/dycore/src/atmos_spectral/init/topog_regularization.f90 /scratch/myoder96/dycore/src/shared/platform/platform.F90 /scratch/myoder96/dycore/src/shared/mpp/mpp.F90 /scratch/myoder96/dycore/src/atmos_spectral/model/fv_advection.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/press_and_geopot.f90 /scratch/myoder96/dycore/src/shared/fft/fft99.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_domains.F90 /scratch/myoder96/dycore/src/atmos_spectral/model/water_borrowing.f90 /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_init_cond.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_reduce.h /scratch/myoder96/dycore/src/shared/field_manager/parse.inc /scratch/myoder96/dycore/src/shared/fms/read_data_4d.inc /scratch/myoder96/dycore/src/shared/fms/write_data.inc /scratch/myoder96/dycore/src/shared/fms/read_data_3d.inc /scratch/myoder96/dycore/src/shared/mpp/mpp_write_2Ddecomp.h /scratch/myoder96/dycore/src/shared/fms/read_data_2d.inc /scratch/myoder96/dycore/src/shared/mpp/mpp_read_2Ddecomp.h /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum.h /scratch/myoder96/dycore/src/shared/mpp/os.h /scratch/myoder96/dycore/src/shared/mpp/mpp_transmit.h /scratch/myoder96/dycore/src/shared/mpp/mpp_sum.h /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum_int.h /scratch/myoder96/dycore/src/shared/mpp/mpp_update_domains2D.h /scratch/myoder96/dycore/src/shared/mpp/mpp_global_reduce.h /scratch/myoder96/dycore/src/shared/mpp/mpp_write.h /scratch/myoder96/dycore/src/shared/mpp/mpp_global_field.h /scratch/myoder96/dycore/src/shared/mpp/mpp_global_sum.h
OBJ = time_manager.o spherical_fourier.o spectral_dynamics.o vert_advection.o atmos_model.o mpp_io.o atmosphere.o fms_io.o tracer_manager.o topography.o spectral_damping.o horiz_interp.o spectral_initialize_fields.o fft.o memuse.o memutils.o gaussian_topog.o implicit.o matrix_invert.o diag_axis.o hs_forcing.o diag_manager.o vert_coordinate.o transforms.o spherical.o constants.o tracer_type.o fms.o spec_mpp.o grid_fourier.o field_manager.o diag_output.o gauss_and_legendre.o nsclock.o leapfrog.o global_integral.o topog_regularization.o platform.o mpp.o fv_advection.o press_and_geopot.o fft99.o mpp_domains.o water_borrowing.o spectral_init_cond.o
OFF = /scratch/myoder96/dycore/src/shared/mpp/mpp_domains.F90 /scratch/myoder96/dycore/src/shared/mpp/mpp_reduce.h /scratch/myoder96/dycore/src/atmos_spectral/tools/gauss_and_legendre.f90 /scratch/myoder96/dycore/src/shared/field_manager/parse.inc /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical.f90 /scratch/myoder96/dycore/src/shared/fms/read_data_4d.inc /scratch/myoder96/dycore/src/atmos_spectral/driver/solo/atmosphere.f90 /scratch/myoder96/dycore/src/shared/fms/fms.f90 /scratch/myoder96/dycore/src/shared/fft/fft.F90 /scratch/myoder96/dycore/src/shared/diag_manager/diag_axis.f90 /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_initialize_fields.f90 /scratch/myoder96/dycore/src/shared/field_manager/field_manager.F90 /scratch/myoder96/dycore/src/atmos_spectral/model/matrix_invert.f90 /scratch/myoder96/dycore/src/shared/fms/write_data.inc /scratch/myoder96/dycore/src/shared/memutils/memutils.F90 /scratch/myoder96/dycore/src/shared/fms/read_data_3d.inc /scratch/myoder96/dycore/src/shared/diag_manager/diag_manager.f90 /scratch/myoder96/dycore/src/shared/fms/read_data_2d.inc /scratch/myoder96/dycore/src/shared/fms/fms_io.F90 /scratch/myoder96/dycore/src/shared/time_manager/time_manager.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/fv_advection.f90 /scratch/myoder96/dycore/src/atmos_param/hs_forcing/hs_forcing.f90 /scratch/myoder96/dycore/src/atmos_solo/atmos_model.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum.h /scratch/myoder96/dycore/src/shared/mpp/os.h /scratch/myoder96/dycore/src/shared/mpp/mpp_chksum_int.h /scratch/myoder96/dycore/src/shared/mpp/mpp_sum.h /scratch/myoder96/dycore/src/shared/diag_manager/diag_output.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_io.F90 /scratch/myoder96/dycore/src/shared/mpp/mpp_update_domains2D.h /scratch/myoder96/dycore/src/shared/mpp/mpp.F90 /scratch/myoder96/dycore/src/shared/mpp/mpp_write.h /scratch/myoder96/dycore/src/atmos_spectral/model/implicit.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_global_sum.h /scratch/myoder96/dycore/src/shared/topography/topography.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/press_and_geopot.f90 /scratch/myoder96/dycore/src/shared/horiz_interp/horiz_interp.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/spec_mpp.f90 /scratch/myoder96/dycore/src/atmos_spectral/init/vert_coordinate.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/tracer_type.f90 /scratch/myoder96/dycore/src/shared/memutils/memuse.c /scratch/myoder96/dycore/src/atmos_spectral/model/leapfrog.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/spherical_fourier.f90 /scratch/myoder96/dycore/src/shared/tracer_manager/tracer_manager.F90 /scratch/myoder96/dycore/src/atmos_spectral/model/water_borrowing.f90 /scratch/myoder96/dycore/src/atmos_spectral/tools/grid_fourier.f90 /scratch/myoder96/dycore/src/shared/fft/fft99.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_write_2Ddecomp.h /scratch/myoder96/dycore/src/atmos_spectral/model/global_integral.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_read_2Ddecomp.h /scratch/myoder96/dycore/src/atmos_spectral/init/topog_regularization.f90 /scratch/myoder96/dycore/src/atmos_shared/vert_advection/vert_advection.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_damping.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_transmit.h /scratch/myoder96/dycore/src/shared/mpp/nsclock.c /scratch/myoder96/dycore/src/shared/topography/gaussian_topog.f90 /scratch/myoder96/dycore/src/shared/mpp/mpp_global_reduce.h /scratch/myoder96/dycore/src/atmos_spectral/tools/transforms.f90 /scratch/myoder96/dycore/src/shared/platform/platform.F90 /scratch/myoder96/dycore/src/shared/mpp/mpp_global_field.h /scratch/myoder96/dycore/src/atmos_spectral/init/spectral_init_cond.f90 /scratch/myoder96/dycore/src/atmos_spectral/model/spectral_dynamics.f90 /scratch/myoder96/dycore/src/shared/constants/constants.f90
clean: neat
	-rm -f .cppdefs $(OBJ) fms.x
neat:
	-rm -f $(TMPFILES)
localize: $(OFF)
	cp $(OFF) .
TAGS: $(SRC)
	etags $(SRC)
tags: $(SRC)
	ctags $(SRC)
fms.x: $(OBJ)
	$(LD) $(OBJ) -o fms.x $(LDFLAGS)
