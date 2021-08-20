# dycore
DynamicCore geo-simulator

### Disclaimer:
yoder, 20 Aug 2021:
Currently, this repo is... not well organized, and geared towards some specific projects, but we will work on that. Note that Dynamic Core (dycore)\
is a subset of the bigger, more general AM4 model. In principle, then, we can achieve most of our DyCore objectives by using the AM4 utilities. The main advantage
of this would be to acquire and use the most updated code. The code in this repo (at this time) is probably pretty ancient.

That said, I did make (minor) modifications to this code to take the initial perturpation and temperature (?) as input parameters, so if we want to start using 
the more current AM4 codebase, we'll want to PR that with T.R.

For a while, this will be a work in progress.


### Overview:
This repository contains
- Some code to be compiled
- A scrpt that was written for the Stanford Earth Mazama HPC to:
  - Compile the code
  - Write a module
  - Lanuch a job ?

This script was derived from some other scripts that came from... somewhere else. In these scripts, for each run, the code was compiled, then an experiment run.
We moved past that and did a central installation, which we reference by module. We might have also modified some of the variable naming conventions.

### A short TODO list:
- Generally, clean it up.
- AM4 modles have all sorts of esoteric rules, like `n_cpu%6 = 0`, and other integer math formatting. These are fairly(ish) well documented in the various AM4 README
docs and our `AM4_runtime` code. The bigger AM4 simulations also have `format` parameters in the `.nml` file. I don't see those in our mini-nml, so it looks like the
we just need to know the rules and request a valid number of processors.
