#!/bin/bash 

ATM_DYCORES_DIR=/mit/aditi_s/oct7

source /etc/profile.d/modules.sh
module add pgi/10.8 
module add mpich 
module add netcdf 

cd $ATM_DYCORES_DIR

# Minimal runscript: Spectral atmospheric core with Held-Suarez forcing
## set echo 
#------------------------------------------------------
# define variables
platform=pgi  # A unique identifier for your platform
npes=16  # number of processors
workdir=$ATM_DYCORES_DIR/workdir  # where model is run and model output is produced
execdir=$ATM_DYCORES_DIR/exec_spectral.$platform  # code is compiled and executable located 
template=$ATM_DYCORES_DIR/bin/mkmf.template.$platform   # path to template for your platform
mkmf=$ATM_DYCORES_DIR/bin/mkmf                      # path to executable mkmf
sourcedir=$ATM_DYCORES_DIR/src  # path to directory containing model source code
pathnames=$ATM_DYCORES_DIR/input/spectral_pathnames  # path to file containing list of source paths
namelist=$ATM_DYCORES_DIR/input/spectral_namelist       # path to namelist file
diagtable=$ATM_DYCORES_DIR/input/hs_diag_table           # path to diagnositics table
fieldtable=$ATM_DYCORES_DIR/input/spectral_field_table   # path to field table (specifies tracers)
mppnccombine=$ATM_DYCORES_DIR/bin/mppnccombine.$platform # path to executable mppnccombine
#-----------------------------------------------------
# compile mppnccombine.c, needed only if $npes > 1
if [ ! -f $mppnccombine ]; then
  $CC -O -o $mppnccombine -I$INC_NETCDF -L$LIB_NETCDF ./postprocessing/mppnccombine.c -lnetcdf
fi
#----------------------------------------------------
# setup directory structure
## NOTE: IF STARTING MODEL WITH INPUT FROM AN EXISTING WORKDIR, COMMENT OUT THIS ENTIRE SECTION
#if [ ! -d $execdir ]; then  mkdir $execdir ; fi 
#if [ -e $workdir ]; then
#  echo "ERROR: Existing workdir may contaminate run.  Move or remove $workdir and try again." > /dev/stderr
#  exit 1
#fi
#mkdir $workdir $workdir/INPUT $workdir/RESTART
#---------------------------------------------------
# compile the model code and create executable
cd $execdir
$mkmf -p fms.x -t $template -c "-Duse_libMPI -Duse_netCDF" -a $sourcedir $pathnames 
make -f Makefile
cd $workdir
#--------------------------------------------------
# set run length and time step, get input data and executable
cat > input.nml <<EOF
 &main_nml
     days   = 100,
     dt_atmos = 600 /
EOF
cat $namelist >> input.nml
cp $diagtable diag_table
cp $fieldtable field_table
cp $execdir/fms.x fms.x
#--------------------------------------------------
# run the model with mpirun
#mpirun -np $npes $ATM_DYCORES_DIR/workdir/fms.x
mpirun -machinefile $PBS_NODEFILE -np $npes $ATM_DYCORES_DIR/workdir/fms.x
#-------------------------------------------------
# combine netcdf files
if [ $npes -gt 1 ]; then
  for ncfile in $( /bin/ls *.nc.0000 )
  do
    $mppnccombine -v -r $ncfile
  done
fi

