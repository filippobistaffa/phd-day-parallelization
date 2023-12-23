#!/bin/bash
#SBATCH --job-name=llama-cpp-description-mixtral
#SBATCH --time=5:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=16G
#SBATCH --output=description-mixtral-%j.out
#SBATCH --error=description-mixtral-%j.err

spack load --first py-pandas
python3 description-mixtral.py
