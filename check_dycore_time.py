#!python
#
import netCDF4
import sys
#
def check_time(fin_name, as_int=True):
    with netCDF4.Dataset(fin_name, 'r') as fout:
        #print('** time: {}\n'.format(fout.variables['time'][0]))
        #print(fout.variables['time'][0])
        #print(fout.variables['time'][-1])
        #
        this_time=fout.variables['time'][-1]
    if as_int:
        this_time=int(this_time)
    #
    return this_time

if __name__=="__main__":
    #print('args: ', sys.argv)
    fin_name = sys.argv[1]
    #
    as_int = True
    if len(sys.argv)>2:
        as_int = sys.argv[2]
    #
    print(check_time(fin_name=fin_name, as_int=as_int) )
    #
    #with netCDF4.Dataset(fin_name, 'r') as fout:
    #    #print('** time: {}\n'.format(fout.variables['time'][0]))
    #    #print(fout.variables['time'][0])
    #    print(fout.variables['time'][-1])
#

