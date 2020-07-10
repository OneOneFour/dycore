#!/bin/bash 
#export MODULEPATH=/usr/local/modulefiles:/share/cees/modules/modulefiles:/opt/ohpc/pub/modulefiles
export MODULEPATH=/share/cees/modules/modulefiles:/opt/ohpc/pub/modulefiles
#
module purge
#module load anaconda3/
module load intel/19
COMP="intel19"
PREREQ_COMP="intel/19.1.0.166"
#
MPI_MOD_STR="openmpi_3/3.1.4"
MPI="openmpi3"
#MPI_MOD_STR="mpich_3/3.3.1"
#MPI="mpich3"
#MPI_MOD_STR="impi/2019.6.166"
#MPI="impi19"

module load ${MPI_MOD_STR}
#
#
#module load mpich_3/
#MPI="mpich3"
#PREREQ_MPI="mpich/3.3.1"
#
# NOTE: for impi/, set FC=mpiifort (note two "ii"). currently, this is being done in the mkmf.template.mazama.
# ugh...
#module load impi_19/
#MPI="impi19"
#PREREQ_MPI="impi/2019.6.166"
#
#
#NETCDF_INC=/share/cees/software/netcdf/intel19-openmpi4/include
#NETCDF_LIB=/share/cees/software/netcdf/intel19-openmpi4/lib64
module load netcdf/
module load netcdf-fortran/
module load udunits/
#
DO_CLEAN=1
DO_MODULE=1
# I don't actually know what version this is...
VER=1.0.0
COMP_MPI="${COMP}_${MPI}"
# an unfortunate -/_ inconsistency (my bad...)
COMP_MPI_MODS="${COMP}-${MPI}"
#

#
# yoder: for improved portability, do we need Bob's anaconda/lib?
# /data/cees/clapp/anaconda3/lib:
#LD_LIBRARY_PATH="/data/cees/clapp/anaconda3/lib:/share/cees/software/netcdf/intel19-openmpi4/lib64:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/usr/lib64:${LD_LIBRARY_PATH}"
PARTITION="twohour"
#
# We want to simplify this in a not-nonsencical way. Unfortunately, to do so, we must do our best to appease
#  two conflicting standards -- NOAA and everybody else. This SW package uses /bin for a bunch of installation
#  and similar files, then putting the executable in the working compile folder, so using /bin for the executables
#  will pro bably be confusing. So let's put our executable in an ./exex folder
#TARGET_PATH="${SCRATCH}/.local/software/DyCore/${COMP_MPI}/${VER}"
#MODULE_PATH="${SCRATCH}/.local/modules/moduledeps/${COMP_MPI_MODS}/dycore"
#module use scratch/myoder96/.local/modules/moduledeps

TARGET_PATH="/share/cees/software/DyCore/${COMP_MPI}/${VER}"
TARGET_EXE_PATH="${TARGET_PATH}/exec"
MODULE_PATH="/share/cees/modules/moduledeps/${COMP_MPI_MODS}/dycore"
#
#ATM_DYCORES_RUN_DIR=/data2/cees/aditis2/dycore
#ATM_DYCORES_SRC_DIR=/data2/cees/aditis2/dycore
#
# yoder:
ATM_DYCORES_RUN_DIR=`cd ..;pwd`
ATM_DYCORES_SRC_DIR=`cd ..;pwd`
#
export NETCDF_INCLUDE=$NETCDF_INC
#
echo "*** ATM_DYCORES_RUN_DIR: ${ATM_DYCORES_RUN_DIR}"
#
PARTITION=twohour
#
cd $ATM_DYCORES_RUN_DIR
#
# Minimal runscript: Spectral atmospheric core with Held-Suarez forcing
## set echo
set -x
#
#------------------------------------------------------
# define variables
platform=mazama  # A unique identifier for your platform
npes=4  # number of processors
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
  #$CC -O -o $mppnccombine -I${NETCDF_INC} -I{HDF5_DIR} -L${NETCDF_LIB} -L${HDF5_LIB} ./postprocessing/mppnccombine.c  -lnetcdf
  ${CC_spp} -O -o $mppnccombine -I${NETCDF_INC} -I{HDF5_DIR} -L${NETCDF_LIB} -L${HDF5_LIB} -lnetcdf ./postprocessing/mppnccombine.c
fi
#----------------------------------------------------
# setup directory structure
if [ ! -d $execdir ]; then  mkdir $execdir ; fi
#
if [[ -e $WORK_DIR ]]; then rm -rf ${WORK_DIR}; fi
if [ -e $WORK_DIR ]; then
  echo "ERROR: Existing WORK_DIR may contaminate run.  Move or remove $WORK_DIR and try again."
  exit 1
  #if [[ -e $WORK_DIR ]]; then rm -rf ${WORK_DIR}; fi
fi
mkdir $WORK_DIR $WORK_DIR/INPUT $WORK_DIR/RESTART
#---------------------------------------------------
# compile the model code and create executable
cd $execdir
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

#cp fms.x ${WORK_DIR}/

cp fms.x ${TARGET_EXE_PATH}/
cp -r $ATM_DYCORES_RUN_DIR/input ${TARGET_PATH}/
cp ${mppnccombine} ${TARGET_EXE_PATH}/
#
# write a module script:
echo "DO_MODULE: ${DO_MODULE}"
#if [[ ${DO_MODULE} -eq 1 ]]; then
echo "Write module to: ${MODULE_PATH}/${VER}.lua"
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
module load intel/19
#
module load ${MPI_MOD_STR}
#module load impi_19/
#module load mpich_3/
#
module load dycore/
module load udunits/
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
