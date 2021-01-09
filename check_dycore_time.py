#!python
#
import netCDF4
import sys
#

if __name__=="__main__":
    #print('args: ', sys.argv)
    fin_name = sys.argv[1]
    #
    with netCDF4.Dataset(fin_name, 'r') as fout:
        #print('** time: {}\n'.format(fout.variables['time'][0]))
        #print(fout.variables['time'][0])
        print(fout.variables['time'][-1])
#

