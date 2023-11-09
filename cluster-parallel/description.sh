#!/bin/bash
#SBATCH --job-name=llama-cpp-description
#SBATCH --time=5:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=16G
#SBATCH --output=description-%j.out
#SBATCH --error=description-%j.err

spack load --first py-pandas
srun python3 description.py --threads 20
