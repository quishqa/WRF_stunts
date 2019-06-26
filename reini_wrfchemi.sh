#!/bin/bash

NAMELISTDIR='namelists/nls'
WRFBDYDIR='mozbc'

for day in `seq -w 12 20`
do
   ln -sf ${NAMELISTDIR}/nl200605${day} namelist.input
   rm wrfbdy_d01 wrfinput_d01 wrf_chem_input_d01 rsl*
   ln -sf wrfout_d01_2006-05-$(printf "%02d" $(expr $day - 1))_00:00:00  wrf_chem_input_d01
   echo "Creating new chem IC"
   ./real.exe
   rm wrfbdy_d01
   echo "Restoring new chem BC"
   ln -sf ${WRFBDYDIR}/wrfbdy_d01 .
   echo "Starting WRF-Chem"
   mpirun -machinefile host_mario -np 32 ./wrf.exe
done



exit 0
