#!/bin/bash
#SBATCH -A hpc2nXXXX-YYY # Change to your own after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
# Asking for one K80 card
#SBATCH --gres=gpu:k80:1

# Load any modules you need
module load GCC/10.3.0  OpenMPI/4.1.1 Python/3.9.5 TensorFlow/2.6.0-CUDA-11.3.1

# Run your Python script
python <my_tf_program.py>
