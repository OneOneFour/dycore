import numpy
import scipy
import datetime as dtm
import matplotlib as mpl
import matplotlib.dates as mpd
import pylab as plt
#
import os
import sys
#
import netCDF4

def concat_dycore_daily(fout_name='dycore_atmos_daily.nc', fnames=[]):
    '''
    # simple tool to concatenate dycore(-like) output NetCDF files.
    # for now, just assume the data files are created correctly (same dimensions and variables,
    #. not overlapping time, etc.)
    # So this is not fully general purpose, but it should be pretty robust.
    # TODO: Consider verifying this, aka that lat_1==lat_2, etc.
    #
    # NOTE: changed *args to fnames=[] model because it is too easy to accidentally just provide
    #. the inputs and overwrite the first input... which i don't know exactly what that would do...
    #. or actually even how that gets interpreted. This is more straight forward...
    '''
    #
    times    = []
    time_lens = []
    #
    #vars_of_interest=['ps', 'height', 'ucomp', 'vcomp', 'temp', 'omega', 'vor', 'time']
    #
    # create a counter index. This is a little redundant (we could just make vars_of_interest a dict{}),
    #. but 1) we have good control of the variables, 2) they don't have to persist, and 3) there is some
    #. safety and value to keeping them separate. though...
    # TODO: look through the code to see if we actually need vars_of_interest[]; originally there was
    #. a plan to do some sorting on this.
    #
    #vars_of_interest_index = {s:0 for s in vars_of_interest}
    #
    for fname in fnames:
        with netCDF4.Dataset(fname, 'r') as fout:
            time_lens += [fout.dimensions['time'].size]
            #times += [fout.variables['time'][0::fout.dimensions['time'].size-1]]
            times += [list(fout.variables['time'][[0,fout.dimensions['time'].size-1]])]
        #
    #
    time_lens = numpy.array(time_lens)
    times = numpy.array(times)
    #
    total_time_len = numpy.sum(time_lens)
    #
    # sorting index:
    ix = numpy.argsort(times[:,0])
    # 
    with netCDF4.Dataset(fout_name, 'w') as fout:
        # Start doing things:
        # copy __dict__, then overwrite as need be. presently, dycor only assigns filename 
        #. and title to __dict__. Let's emulate and overwrite as needed.
        #
        for k, (fname, ix) in enumerate(sorted(zip(fnames, ix), key=lambda rw:rw[1])):
            with netCDF4.Dataset(fname, 'r') as fin:
                # handle the k==0 case up front. Create dimensions and variables; assign non
                # f(t) variables:
                if k==0:
                    # create base elements. Assume all that are not f(t) are constant for all
                    #. inputs ? use last input???
                    # assign (presumed-to-be) static variables
                    #
                    time_dep_vars_index = {nm:0 for nm,v in fin.variables.items() 
                                              if 'time' in v.dimensions}
                    #
                    fout.setncatts(fin.__dict__)
                    #fout.__dict__['input_files']=['input_files']
                    fout.setncattr_string('input_files', fnames)
                    #fout.input_files = [['']]
                    #
                    for nm,dm in fin.dimensions.items():
                        if nm=='time':
                            n=total_time_len
                        else:
                            n = dm.size
                        #
                        fout.createDimension(nm, (n if not dm.isunlimited() else None) )
                        #fout.create_dimension(nm, n)
                    #
                    for nm, v in fin.variables.items():
                        #fout.create_variable()
                        x = fout.createVariable(nm, v.datatype, v.dimensions)
                        #
                        # if not time dependent, assign:
                        if not 'time' in v.dimensions:
                            # create variable, assign values, assign meta-data:
                            fout[nm][:] = fin[nm][:]
                            fout[nm].setncatts(fin[nm].__dict__)
                        #
                    #
                    #continue
                #
                # else k != 0
                #fout.__dict__['input_files'] += [fname]
                #fout.setncattr_string('input_files', fout.input_files + [fname])
                #print('*** DEBUG: ', type(fout.input_files), fout.input_files)
                #fout.input_files += [fname]
                # for all k, loop through vars_of_interest:
                for nm, k_v in time_dep_vars_index.items():
                    dk = fin.dimensions['time'].size
                    #
                    if len(fin[nm].dimensions)>1:
                        fout[nm][k_v:k_v + dk,:] = fin[nm][:]
                    else:
                        fout[nm][k_v:k_v + dk] = fin[nm][:]
                    #
                    fout[nm].setncatts(fin[nm].__dict__)
                    #
                    time_dep_vars_index[nm] += dk
                    #
                #
    #
    #return times, time_lens
    return None

def get_time(fin_name, which_time='max', verbose=0):
    with netCDF4.Dataset(fin_name, 'r') as fin:
        #print('** time: {}\n'.format(fout.variables['time'][0]))
        if which_time=='max':
            t = fin.variables['time'][-1]
        elif which_time=='min':
            t = fin.variables['time'][0]
        else:
            t = numpy.array([fin.variables['time'][0], fin.variables['time'][-1]])
        #
        if verbose:
            print(t)
        #
        #
    return t
