#!/bin/bash

if hash sbatch 2>/dev/null
then
    spack load --first gcc@10.2.0
fi

make -C llama.cpp LLAMA_CUBLAS=1
