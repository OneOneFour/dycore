#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2g
#SBATCH --output=dycore_compile_%j.out
#SBATCH --error=dycore_compile_%j.out
#SBATCH --constraint=CPU_GEN:RME
#
# TODO: integrate compile_template_module dynamic compiler, MPI, etc. elements
#
module use /home/groups/s-ees/share/cees/spack_cees/spack/share/spack/lmod_zen2_zen2-beta/linux-centos7-x86_64/Core
#module use /scratch/users/myoder96/spack_dev/base/spack/share/spack/lmod_intel19/linux-centos7-x86_64/Core 
#module use /scratch/users/myoder96/spack_dev/base/spack/share/spack/lmod_intel21/linux-centos7-x86_64/Core
#
module purge

module load gcc/10.
#
#module load devel icc ifort
module load intel-cees-beta/
#module load intel-oneapi-mkl-cees-beta/
#module load gcc-cees-beta/

module load mpich-cees-beta/
#module load intel-oneapi-mpi/

module load netcdf-c-cees-beta/
module load netcdf-fortran-cees-beta/
module load m4-cees-beta/

#module load intel-cees-beta/
#module load gcc-cees-beta/

#module load mpich-cees-beta/
#module load intel-oneapi-mpi-cees-beta/
#module load openmpi-cees-beta/
#
echo "*** Modules:"
module list
#
#COMP="intel19"
#COMP="gcc11"
COMP="intel202104"
#MPI="impi"
MPI="mpich"
#MPI="openmpi"
#
#module load netcdf-c-cees-beta/
#module load netcdf-fortran-cees-beta/
##module load udunits/
#
DO_CLEAN=1
DO_MODULE=0
# I don't actually know what version this is...
VER=1.0.1
COMP_MPI="${COMP}_${MPI}"
# an unfortunate -/_ inconsistency (my bad...)
COMP_MPI_MODS="${COMP}-${MPI}"
#
# TODO: we may have needed this, or needed to put it first for some reason. but
#  we shouldn't need to specify /usr/lib64 should we?
#LD_LIBRARY_PATH="/usr/lib64:${LD_LIBRARY_PATH}"
PARTITION="serc"
#
PLATFORM="sh03_serc"
TARGET_PATH="`cd ../;pwd`/bin"
#TARGET_PATH="${SCRATCH}/.local/software/DyCore/${COMP_MPI}/${VER}"
TARGET_EXE_PATH="${TARGET_PATH}/exec"
MODULE_PATH="/share/cees/modules/moduledeps/${COMP_MPI_MODS}/dycore"
#
# yoder:
ATM_DYCORES_RUN_DIR=`cd ..;pwd`
ATM_DYCORES_SRC_DIR=`cd ..;pwd`
#
#
#########
# Set Up Compiler-Name variables:
#
# NOTE: Moved all the mkmf.template stuff here:
# gcc-MPICH and gcc-openmpi, intel-mpich
#export LD=${FC}
export CC_spp=${CC}
#FC=$(dirname  ${MPICC})/mpifort
export FC=${MPIF90}
export CC=${MPICC}
#export LD=${MPIFC}
export LD=ifort
export CXX=${MPICXX}
#
## intel-intel:
## note: binaries are like mpicc, mpiicc, mpicxx, mpiicpc, ... don't really know the difference (if any)
#CC_spp=icc
#FC=$(dirname  $(which mpicc))/mpiifort
#CC=$(dirname  $(which mpicc))/mpiicc
##LD=${MPIFC}
#LD=${FC}
#CXX=$(dirname  $(which mpicc))/mpiicpc
#
## gcc-impi:
# NOTE: these look like a gift, but I don't think they are; I think they are old  binaries (just
#  the gnu@4.8.5 binaries). Maybe better if intel is compiled with a newer gcc?
## note: binaries are like mpicc, mpiicc, mpicxx, mpiicpc, ... don't really know the difference (if any)
#CC_spp=icc
#FC=$(dirname  $(which mpicc))/mpifc
#CC=$(dirname  $(which mpicc))/mpigcc
##LD=${MPIFC}
#LD=${FC}
#CXX=$(dirname  $(which mpicc))/mpigxx
#
echo "*** COMPILERS: CC: ${CC} :: ${CXX} --version"
echo "*** CXX: ${CXX} :: `${CXX} --version`"
echo "*** FC: ${FC} :: ${FC} --version"
#
#MPI_PATH=$(dirname $(dirname ${MPICC}))
export MPI_PATH=$(dirname $(dirname $(which mpicc)))
echo "**** MPI_PATH:: $MPI_PATH"
# MPICH:
MPI_CFLAGS="$(pkg-config --cflags ${MPI_PATH}/lib/pkgconfig/mpich.pc) "
MPI_FFLAGS=$MPI_CFLAGS
MPI_LIBS="$(pkg-config --libs ${MPI_PATH}/lib/pkgconfig/mpich.pc) -lmpifort "
#MPI_LIBS="-L${MPI_PATH}/lib -lmpi -lmpifort "
#
##intel-oneapi-mpi
#MPI_CFLAGS=$(pkg-config ${MPI_PATH}/lib/pkgconfig/impi.pc --cflags)
#MPI_FFLAGS=$MPI_CFLAGS
#MPI_LIBS=$(pkg-config ${MPI_PATH}/lib/pkgconfig/impi.pc --libs)
##
# OMPI
#MPI_FFLAGS = $(pkg-config ${MPI_PATH}/lib/pkgconfig/ompi-fort.pc --cflags)
#MPI_CFLAGS = $(pkg-config ${MPI_PATH}/lib/pkgconfig/ompi-c.pc --cflags)
#MPI_LIBS = $(pkg-config ${MPI_PATH}/lib/pkgconfig/ompi-fort.pc --libs)
#
#export FFLAGS=" -O2 -fcray-pointer -fallow-argument-mismatch -Wall $(nc-config --fflags) $(nf-config --fflags) ${MPI_FFLAGS}"
#export FFLAGS=" -O2 $(nc-config --fflags) $(nf-config --fflags) ${MPI_FFLAGS}"
export FFLAGS=" -i4 -r8 -fpp -O2 $(nc-config --fflags) $(nf-config --fflags) ${MPI_FFLAGS}"
#  $(nc-config --cflags)
#  $(nc-config --libs)
# -L/usr/lib64 
export LIBS="  ${MPI_LIBS} $(nc-config --flibs) $(nf-config --flibs) ${MPI_LIBS} -lm "
export LDFLAGS=" ${LIBS}"
export CFLAGS="-D__IFC ${MPI_CFLAGS} $(nc-config --cflags)"

####
#
echo "*** ATM_DYCORES_RUN_DIR: ${ATM_DYCORES_RUN_DIR}"
#
cd $ATM_DYCORES_RUN_DIR
#
# Minimal runscript: Spectral atmospheric core with Held-Suarez forcing
## set echo
set -x
#
#------------------------------------------------------
# define variables
platform=$PLATFORM  # A unique identifier for your platform
npes=1  # number of processors
WORK_DIR=$ATM_DYCORES_RUN_DIR/workdir_compile_${COMP_MPI}  # where model is run and model output is produced
execdir=$ATM_DYCORES_RUN_DIR/exec_spectral.$platform  # code is compiled and executable located
template=$ATM_DYCORES_RUN_DIR/bin/mkmf.template.$platform   # path to template for your platform
mkmf=$ATM_DYCORES_RUN_DIR/bin/mkmf                      # path to executable mkmf
sourcedir=$ATM_DYCORES_SRC_DIR/src  # path to directory containing model source code
pathnames=$ATM_DYCORES_RUN_DIR/input/spectral_pathnames  # path to file containing list of source paths
namelist=$ATM_DYCORES_RUN_DIR/input/spectral_namelist       # path to namelist file
diagtable=$ATM_DYCORES_RUN_DIR/input/hs_diag_table           # path to diagnositics table
fieldtable=$ATM_DYCORES_RUN_DIR/input/spectral_field_table   # path to field table (specifies tracers)
mppnccombine=$ATM_DYCORES_SRC_DIR/bin/mppnccombine.$platform # path to executable mppnccombine
#-----------------------------------------------------
# compile mppnccombine.c, needed only if $npes > 1
# NOTE: don't use the MPI compiler for this...

if [ ! -f $mppnccombine ]; then
	${CC} -O -o $mppnccombine $(nc-config --cflags) $(nc-config --libs) ./postprocessing/mppnccombine.c
	#
	if [[ ! $? -eq 0 ]]; then
		echo "**** ERROR while compiling mppnccombine. Exiting."
		exit 1
	fi
fi
#
#----------------------------------------------------
# setup directory structure
if [[ ${DO_CLEAN} -eq 1 ]]; then
	rm -rf ${execdir}
fi
if [ ! -d $execdir ]; then  mkdir $execdir ; fi
if [[ -e $WORK_DIR ]]; then rm -rf ${WORK_DIR}; fi
if [ -e $WORK_DIR ]; then
  echo "ERROR: Existing WORK_DIR may contaminate run.  Move or remove $WORK_DIR and try again."
  exit 1
  #if [[ -e $WORK_DIR ]]; then rm -rf ${WORK_DIR}; fi
fi
mkdir -p $WORK_DIR/INPUT $WORK_DIR/RESTART
#---------------------------------------------------
# compile the model code and create executable
cd $execdir
#echo "$mkmf -p fms.x -t $template -c \"-Duse_libMPI -Duse_netCDF\" -a $sourcedir $pathnames"
#
$mkmf -p fms.x -t $template -c "-Duse_libMPI -Duse_netCDF" -a $sourcedir $pathnames
#
if [[ ${DO_CLEAN} -eq 1 ]]; then
    make clean
fi
# looks like parallel compilation breaks this...
make -f Makefile
#
# continually getting a "make: warning:  Clock skew detected." warning, which might trigger this code?
if [[ ! $? -eq 0 ]]; then
    echo "error occurred in Make. Exiting."
    exit 1
fi
#
if [[ ! -d ${TARGET_PATH} ]]; then mkdir -p ${TARGET_PATH}; fi
if [[ ! -d ${TARGET_EXE_PATH} ]]; then mkdir -p ${TARGET_EXE_PATH}; fi
#
cp fms.x ${TARGET_EXE_PATH}/
cp -r $ATM_DYCORES_RUN_DIR/input ${TARGET_PATH}/
cp ${mppnccombine} ${TARGET_EXE_PATH}/
#
# write a module script:
echo "DO_MODULE: ${DO_MODULE}"
#if [[ ${DO_MODULE} -eq 1 ]]; then
echo "Write module to: ${MODULE_PATH}/${VER}.lua"

echo "*** *** Intentionally Exiting script *** ***"
exit 1


if [[ ! -d ${MODULE_PATH} ]]; then mkdir -p ${MODULE_PATH} ; fi
#
cat > ${MODULE_PATH}/${VER}.lua <<EOF
-- -*- lua -*-
--
prereq("${PREREQ_COMP}")
prereq("${MPI_MOD_STR}")
--
depends_on("netcdf/")
depends_on("netcdf-fortran/")
depends_on("udunits/")
--
whatis("Name: dycore spectral, built from ${COMP_MPI} toolchain.")
--
VER="${VER}"
SW_DIR="${TARGET_PATH}"
BIN_DIR=pathJoin(SW_DIR, "exec")
--
pushenv("DYCORE_DIR", SW_DIR)
pushenv("DYCORE_BIN", BIN_DIR)
pushenv("DYCORE_MPPNCCOMBINE", pathJoin(BIN_DIR, "mppnccombine.mazama"))
--
prepend_path("PATH", BIN_DIR)
-- this to see that curl finds the right library. it is sometimes finding some obscure
--  versions of the shared library.
prepend_path("LD_LIBRARY_PATH", "/usr/lib64")
EOF
    #
#fi

#
# How to run a job...
echo "Write an input script, copy"
cd ${WORK_DIR}
#--------------------------------------------------
# set run length and time step, get input data and executable
cat > input.nml <<EOF
&main_nml
     days   = 50,
     dt_atmos = 600 /

&spectral_init_cond_nml initial_temperature = 275.0, initial_perturbation = 2.001e-7 /
EOF

cat $namelist >> input.nml
cp $diagtable diag_table
cp $fieldtable field_table
#cp $execdir/fms.x fms.x
#
#
#exit 1
echo "now create and submit a batch script in ${WORK_DIR}: "
pwd

if [[ -f submit.sh ]]; then
    rm -f submit.sh
fi
#
cat << EOF  >submit.sh
#!/bin/bash
#SBATCH --job-name=dycore_compile_${COMP_MPI}
#SBATCH --ntasks=${npes}
#SBATCH --ntasks-per-node=${npes}
#SBATCH --partition=${PARTITION}
#SBATCH --chdir=${WORK_DIR}
#SBATCH --output=outfile_${COMP_MPI}.%j.out
#SBATCH --error=outfile_${COMP_MPI}.%j.err
#
module purge
module load gcc-cees/
module load mpich-cees/
module load netcdf-c-cees/
module load netcdf-fortran-cees/
#
#
ulimit -s unlimited
#
mpirun -np ${npes} fms.x
#
# combine netcdf files
if [[ ${npes} -gt 1 ]]; then
  for ncfile in \$( ls *.nc.0000 )
  do
    \${DYCORE_MPPNCCOMBINE}  -v -r \$ncfile
  done
fi
EOF

#
echo "submit.sh should be created..."
#
#exit 1

cd ${WORK_DIR}
sbatch submit.sh

watch squeue -u ${USER}
