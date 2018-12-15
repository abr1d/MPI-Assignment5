
#!/bin/bash
#SBATCH -t 1:00:00
#SBATCH -N 12
#SBATCH --ntasks-per-node 4

set -x

echo $SLURM_SUBMIT_DIR

# module load mpi/gcc_openmpi

cd /scratch
/software/openmpi/3.1.2/bin/mpicc  /scratch/pi_mc.c -lm

sudo touch output.txt
sudo chmod 777 output.txt

for i in {2..12..2}
do
  echo "With ${i} processes"
  time /software/openmpi/3.1.2/bin/mpirun -np $i --hostfile ./machine_list ./a.ou$
done
