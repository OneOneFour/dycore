# script to run initial perturbation sequence.
#
# run a sequence of job arrays:
mkdir IP_outputs
for k1 in {0..100..10}
do
	k2=`echo "$k1+9"|bc`
    echo "ks2: $k1, $k2"
	echo "sbatch --output=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%A_%a.out --error=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%A_%a.err -n 4 --array=$k1-$k2 run_spectral_sample.bs"
    sbatch --output=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%A_%a.out --error=IP_outputs/dycore_perturbation_ary_${k1}_${k2}+%A_%a.err -n 4 --array=$k1-$k2 run_spectral_sample.bs
done
