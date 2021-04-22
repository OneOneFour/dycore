# script to run initial perturbation sequence.
#
# run a sequence of job arrays:

if [[ -d IP_outputs ]]; then rm -rf IP_outputs; fi
mkdir IP_outputs

DK=3
NPE=8

#for k1 in {0..100..4}
for k1 in {0..5}
do
    k2=`echo "$k1+$DK"|bc`
    echo "ks2: $k1, $k2"
    #echo "sbatch --output=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%j_%a.out --error=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%j_%a.err -n 4 --array=$k1-$k2 run_spectral_sample.bs"
    #sbatch --output=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%j_%a.out --error=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%j_%a.err -n 4 --array=$k1-$k2 run_spectral_sample.bs
    #
    EXEC="sbatch --job-name=dycore_IP_${k1}_${k2} --output=IP_outputs/dycore_perturbation_ary_${k1}_${k2}_%j_%a.out --error=IP_outputs/dycore_perturbation_ary_${k1}_${k2}_%j_%a.err -n ${NPE} --array=$k1-k2 run_spectral_sample.bs"
    echo ${EXEC}
    #${EXEC}     
    #sbatch sbatch --output=IP_outputs/dycore_perturbation_ary_${k1}_%a.out --error=IP_outputs/dycore_perturbation_ary_${k1}_%a.err -n 8 --array=$k1 run_spectral_sample.bs
done
