cwd=$(pwd);
#--------------------------------------------------------------------------------------------------------
# define variables
platform="apple"
template="mkmf.template.$platform"    # path to template for your platform
mkmf="$cwd/bin/mkmf"                           # path to executable mkmf
sourcedir="$cwd/src"                           # path to directory containing model source code
mppnccombinesrc="$cwd/postprocessing/mppnccombine.c"
#--------------------------------------------------------------------------------------------------------
execdir="${cwd}/exec.$platform"       # where code is compiled and executable is created
inputdir="${cwd}/input"
pathnames="$inputdir/spectral_pathnames"           # path to file containing list of source paths
diagtable="$inputdir/hs_diag_table"           # path to diagnositics table
fieldtable="$inputdir/spectral_field_table"         # path to field table (specifies tracers)
#--------------------------------------------------------------------------------------------------------
#

# -----------------------------------------------------------------------------------------------
# Define Compilers
# -----------------------------------------------------------------------------------------------

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


# -----------------------------------------------------------------------------------------------
# Compile mppnccombine
# -----------------------------------------------------------------------------------------------
if [[ -d $execdir ]]; then
    rm -rf $execdir;
fi;
mkdir $execdir;

cd $execdir;

$CC -g -O2 -o mppnccombine.${platform}  $(nc-config --cflags) $(nc-config --libs) $mppnccombinesrc;

# -----------------------------------------------------------------------------------------------
# Create Input Files 
# -----------------------------------------------------------------------------------------------

echo "copying file";

# Copy defauly diagnostic and field tables
cp $diagtable diag_table
cp $fieldtable field_table

# Default Input Files
cat > input.nml <<EOF
&main_nml
     days   = 50,
     dt_atmos = 600 /
&spectral_init_cond_nml initial_temperature = 275.0, initial_perturbation = 2.001e-7 /
EOF

cat $inputdir/spectral_namelist >> input.nml # spectral dycore specific parameters

# -----------------------------------------------------------------------------------------------
# Compile Dycore
# -----------------------------------------------------------------------------------------------

echo "dycore compilation";

$mkmf -p dycore -t "$cwd/bin/mkmf.template.$platform" -c"-Duse_libMPI -Duse_netCDF -DgFortran" -a $sourcedir $pathnames
echo "Beginning make";
make;

if [ $platform == "apple" ]; then
    echo "Adding in debug symbols for mac";
    dsymutil dycore -o dycore.dSYM;
fi


## -----------------------------------------------------------------------------------------------
## Tidy up directories
## -----------------------------------------------------------------------------------------------
rm *.o; # Remove Object files
mkdir -p $cwd/include; # Create include directory if it does not exist
mv *.mod $cwd/include; # Move module files to include directory
mkdir RESTART;
echo "done";