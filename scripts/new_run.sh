#PBS -q long
#PBS -N aditi_s_atm_dycores_o7
#PBS -l nodes=1:ppn=8,walltime=24:00:00
#PBS -e aditi_s_atm_dycores_test.stderr
#PBS -o aditi_s_atm_dycores_test.stdout
#PBS -M aditi_s@mit.edu
#PBS -m abe

#rm -rf /mit/aditi_s/oct7/workdir
#/mit/aditi_s/oct7/scripts/run_spectral_start.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/01_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/01_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart01
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart01
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/02_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/02_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart02
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart02
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/03_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/03_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart03
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart03
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/04_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/04_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart04
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart04
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/05_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/05_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart05
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart05
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/06_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/06_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart06
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart06
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/07_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/07_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart07
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart07
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/08_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/08_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart08
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart08
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/09_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/09_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart09
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart09
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/10_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/10_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart10
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart10
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/11_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/11_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart11
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart11
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/12_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/12_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart12
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart12
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/13_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/13_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart13
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart13
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/14_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/14_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart14
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart14
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/15_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/15_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart15
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart15
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/16_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/16_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart16
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart16
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/17_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/17_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart17
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart17
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/18_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/18_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart18
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart18
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/19_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/19_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart19
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart19
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/20_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/20_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart20
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart20
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/21_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/21_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart21
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart21
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/22_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/22_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart22
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart22
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/23_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/23_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart23
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart23
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/24_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/24_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart24
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart24
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/25_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/25_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart25
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart25
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/26_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/26_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart26
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart26
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/27_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/27_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart27
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart27
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/28_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/28_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart28
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart28
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/29_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/29_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart29
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart29
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/30_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/30_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart30
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart30
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/31_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/31_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart31
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart31
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/32_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/32_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart32
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart32
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/33_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/33_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart33
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart33
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/34_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/34_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart34
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart34
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/35_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/35_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart35
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart35
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/36_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/36_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart36
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart36
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/37_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/37_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart37
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart37
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/38_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/38_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart38
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart38
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/39_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/39_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart39
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart39
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/40_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/40_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart40
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart40
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/41_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/41_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart41
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart41
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/42_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/42_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart42
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart42
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/43_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/43_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart43
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart43
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/44_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/44_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart44
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart44
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/45_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/45_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart45
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart45
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/46_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/46_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart46
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart46
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/47_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/47_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart47
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart47
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/48_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/48_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart48
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart48
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/49_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/49_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart49
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart49
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/50_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/50_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart50
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart50
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/51_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/51_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart51
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart51
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/52_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/52_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart52
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart52
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/53_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/53_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart53
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart53
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/54_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/54_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart54
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart54
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/55_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/55_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart55
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart55
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/56_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/56_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart56
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart56
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/57_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/57_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart57
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart57
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/58_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/58_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart58
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart58
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/59_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/59_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart59
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart59
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/60_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/60_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart60
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart60
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/61_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/61_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart61
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart61
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/62_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/62_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart62
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart62
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/63_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/63_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart63
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart63
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/64_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/64_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart64
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart64
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/65_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/65_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart65
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart65
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/66_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/66_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart66
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart66
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/67_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/67_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart67
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart67
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/68_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/68_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart68
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart68
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/69_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/69_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart69
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart69
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/70_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/70_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart70
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart70
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/71_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/71_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart71
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart71
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/72_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/72_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart72
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart72
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/73_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/73_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart73
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart73
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/74_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/74_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart74
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart74
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/75_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/75_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart75
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart75
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/76_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/76_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart76
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart76
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/77_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/77_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart77
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart77
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/78_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/78_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart78
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart78
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/79_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/79_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart79
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart79
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/80_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/80_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart80
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart80
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/81_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/81_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart81
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart81
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/82_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/82_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart82
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart82
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/83_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/83_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart83
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart83
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/84_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/84_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart84
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart84
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/85_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/85_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart85
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart85
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/86_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/86_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart86
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart86
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/87_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/87_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart87
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart87
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/88_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/88_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart88
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart88
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/89_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/89_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart89
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart89
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/90_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/90_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart90
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart90
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/91_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/91_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart91
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart91
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/92_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/92_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart92
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart92
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/93_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/93_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart93
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart93
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/94_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/94_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart94
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart94
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

#/mit/aditi_s/oct7/scripts/run_spectral_run.bash
#mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/95_atmos_average.nc
#mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/95_atmos_daily.nc
#mkdir /mit/aditi_s/oct7/workdir/restart95
#cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart95
#mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/96_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/96_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart96
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart96
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/97_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/97_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart97
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart97
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/98_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/98_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart98
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart98
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/99_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/99_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart99
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart99
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/100_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/100_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart100
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart100
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/101_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/101_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart101
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart101
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/102_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/102_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart102
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart102
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/103_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/103_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart103
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart103
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/104_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/104_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart104
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart104
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/105_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/105_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart105
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart105
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/106_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/106_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart106
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart106
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/107_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/107_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart107
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart107
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/108_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/108_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart108
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart108
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/109_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/109_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart109
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart109
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/110_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/110_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart110
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart110
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/111_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/111_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart111
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart111
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/112_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/112_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart112
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart112
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/113_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/113_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart113
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart113
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/114_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/114_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart114
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart114
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/115_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/115_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart115
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart115
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/116_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/116_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart116
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart116
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/117_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/117_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart117
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart117
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/118_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/118_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart118
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart118
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/119_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/119_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart119
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart119
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT

/mit/aditi_s/oct7/scripts/run_spectral_run.bash
mv -f /mit/aditi_s/oct7/workdir/atmos_average.nc /mit/aditi_s/oct7/workdir/120_atmos_average.nc
mv -f /mit/aditi_s/oct7/workdir/atmos_daily.nc /mit/aditi_s/oct7/workdir/120_atmos_daily.nc
mkdir /mit/aditi_s/oct7/workdir/restart120
cp /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/restart120
mv -f /mit/aditi_s/oct7/workdir/RESTART/* /mit/aditi_s/oct7/workdir/INPUT















































