#!/bin/bash
#SBATCH --job-name=llama-cpp-description-gpu
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=16G
#SBATCH --output=description-gpu-%j.out
#SBATCH --error=description-gpu-%j.err

spack load cuda@11.8.0
spack load --first py-pandas

srun python3 description.py --threads 20 --n-gpu-layers 40
