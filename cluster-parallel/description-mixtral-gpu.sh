#!/bin/bash
#SBATCH --job-name=llama-cpp-description-mixtral-gpu
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=16G
#SBATCH --output=description-mixtral-gpu-%j.out
#SBATCH --error=description-mixtral-gpu-%j.err

spack load cuda@11.8.0
spack load --first py-pandas

python3 description-mixtral.py --n-gpu-layers 12
