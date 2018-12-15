#!/bin/bash

set -x

echo $SLURM_SUBMIT_DIR

module load mpi/gcc_openmpi

cd /scratch
mpicc a.out /scratch/pi_mc.c -lm

for i in {2..12..2}
do
  echo "With ${i} processes"
  time mpirun -np $i --hostfile ./machine_list ./a.out 100000
done
