execLoc='exec.apple';
baseDir=$(pwd);

CC=mpicc
FC=mpifort
LD=mpifort
CXX=mpicxx

set -e 

if [[ ! $($CC -show | grep gcc) ]]; then 
    echo "mpicc is not present OR is not compiled to use gcc";
fi;

if [[ !  $($FC -show | grep gfortran) ]]; then
    echo "mpifort is not present OR is not compiled to use gfortran";
fi;




if [[ -d $execLoc ]]; then
    rm -rf $execLoc;
fi;
mkdir $execLoc;

cd $execLoc;

clang -g -O2 -o mppnccombine.apple  $(nc-config --cflags) $(nc-config --libs) $baseDir/postprocessing/mppnccombine.c;


echo "copying file";

cp $baseDir/input/hs_diag_table diag_table
cp $baseDir/input/spectral_field_table field_table
cat > input.nml <<EOF
&main_nml
     days   = 50,
     dt_atmos = 600 /
&spectral_init_cond_nml initial_temperature = 275.0, initial_perturbation = 2.001e-7 /
EOF
cat $baseDir/input/spectral_namelist >> input.nml
cat $baseDir/input/cg_drag_nml >> input.nml

echo "dycore compilation";

$baseDir/bin/mkmf -p dycore -t $baseDir/bin/mkmf.template.apple -c"-Duse_libMPI -Duse_netCDF -DgFortran" -a $baseDir/src $baseDir/input/spectral_pathnames;
echo "Beginning make";
make;
dsymutil dycore -o dycore.dSYM;
rm *.o;
mkdir -p $baseDir/include
mv *.mod $baseDir/include;
mkdir RESTART;
mkdir INPUT;
cp $baseDir/input/cg_drag_king_params.nc INPUT/cg_drag_king_params.nc;
echo "done";