#!/bin/bash
#SBATCH -A hpc2n2024-025 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#SBATCH --gres=gpu:v100:1 
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
#R version 4.0.4 is the only one compiled for CUDA
ml GCC/10.2.0  CUDA/11.1.1 OpenMPI/4.0.5
ml R/4.0.4

R --no-save --no-restore -f Rscript.R
