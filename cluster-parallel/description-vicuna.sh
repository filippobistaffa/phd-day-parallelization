#!/bin/bash
#SBATCH --job-name=llama-cpp-description-vicuna
#SBATCH --time=10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=16G
#SBATCH --output=description-vicuna-%j.out
#SBATCH --error=description-vicuna-%j.err

spack load --first py-pandas

python3 description.py --seed $RANDOM
