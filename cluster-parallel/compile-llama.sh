#!/bin/bash

HOSTNAME=$(hostname)

if [ "$HOSTNAME" == "vega.iiia.csic.es" ]
then
    spack load --first gcc@10.2.0
    spack load cmake@3.24.3
fi

cmake -S llama.cpp -B llama.cpp/build
cmake --build llama.cpp/build --config Release -- -j
