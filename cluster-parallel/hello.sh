#!/bin/bash
#SBATCH --job-name=hello-world
#SBATCH --time=0:10
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --output=hello-world.out
#SBATCH --error=hello-world.err

srun python3 hello.py
