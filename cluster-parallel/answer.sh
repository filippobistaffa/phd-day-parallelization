#!/bin/bash
#SBATCH --job-name=llama-cpp-answer
#SBATCH --time=10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=12GB
#SBATCH --output=answer.out
#SBATCH --error=answer.err

LLAMA_CPP_HOME="/home/filippo.bistaffa/phd-day-parallelization/cluster-parallel/llama.cpp"
MODEL="${LLAMA_CPP_HOME}/models/vicuna-13b-v1.5-16k.Q4_K_M.gguf"

PROMPT="The Answer to the Ultimate Question of Life, the Universe, and Everything is"

srun ${LLAMA_CPP_HOME}/build/bin/main --model ${MODEL} --prompt "${PROMPT}" --escape --log-disable --repeat_penalty 1.1 --ctx-size 4096 --n-predict -1 --temp 0.7
