#!/bin/bash
#
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --job-name=finish_mppncc
#
module purge
module load intel/19
module load openmpi_3/
module load dycore/


WORKDIR_ROOT="/scratch/myoder96/dycore/run_IP_tree/workdir_IP_tree_gauss0"
#
echo "*** WORKDIR_ROOT: $WORKDIR_ROOT"
echo "MPPNCC: ${DYCORE_MPPNCCOMBINE}"
#exit 1

# TODO: write a smart script to look through the directory tree for jobs where jusut mppncc did not complete.
#  for now, just do *just that part* for all of the ones we know.
#
ulimit -s unlimited
#
for k in `seq 0 9`
do
  for j in `seq 0 9`
  do
    echo "** Doing MPPNCC for:: ${WORKDIR_ROOT}/ary_${k}_${j}"
    #
    cd ${WORKDIR_ROOT}/ary_${k}_${j}
    #
    if [[ -f atmos_daily.nc.0000 ]]; then
      mv atmos_average.nc atmos_average.nc.bkp
      mv atmos_daily.nc atmos_daily.nc.bkp
      #
      for ncfile in $( ls *.nc.0000 )
      do
        ${DYCORE_MPPNCCOMBINE}  -v -r $ncfile
      done
    fi
  done
done

