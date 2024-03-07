#!/bin/bash
# Batch script for running the numba program "add-list.py" on Kebnekaise
#SBATCH -A hpc2n2024-025 # Remember to change this to your own project ID
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one V100
#SBATCH --gres=gpu:v100:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/11.3.0  OpenMPI/4.1.4 Python/3.10.4 SciPy-bundle/2022.05 CUDA/11.7.0

# Run your Python script
python add-list.py
