#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A hpc2nXXXX-YYY
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# The following two lines splits the output in a file for any errors and a file for other output.
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out
# Asking for one K80
#SBATCH --gres=gpu:k80:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/10.3.0  OpenMPI/4.1.1 PyTorch/1.10.0-CUDA-11.3.1

srun python pytorch_fitting_gpu.py
