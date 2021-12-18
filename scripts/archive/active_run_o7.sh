#PBS -q long
#PBS -N aditi_s_atm_dycores_o7
#PBS -l nodes=1:ppn=8,walltime=24:00:00
#PBS -e aditi_s_atm_dycores_test.stderr
#PBS -o aditi_s_atm_dycores_test.stdout
#PBS -M aditi_s@mit.edu
#PBS -m abe

rm -rf /mit/aditi_s/oct7/workdir
/mit/aditi_s/oct7/scripts/run_spectral_start.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/01_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/01_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart01
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart01
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/02_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/02_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart02
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart02
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/03_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/03_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart03
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart03
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/04_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/04_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart04
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart04
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/05_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/05_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart05
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart05
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/06_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/06_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart06
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart06
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/07_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/07_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart07
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart07
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/08_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/08_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart08
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart08
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/09_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/09_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart09
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart09
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/10_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/10_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart10
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart10
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/11_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/11_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart11
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart11
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/12_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/12_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart12
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart12
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/13_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/13_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart13
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart13
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/14_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/14_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart14
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart14
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/15_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/15_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart15
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart15
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/16_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/16_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart16
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart16
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/17_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/17_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart17
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart17
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/18_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/18_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart18
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart18
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/19_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/19_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart19
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart19
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/20_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/20_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart20
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart20
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/21_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/21_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart21
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart21
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/22_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/22_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart22
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart22
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/23_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/23_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart23
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart23
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/24_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/24_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart24
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart24
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/25_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/25_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart25
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart25
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/26_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/26_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart26
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart26
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/18_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/18_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart18
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart18
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/19_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/19_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart19
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart19
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/20_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/20_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart20
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart20
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT
