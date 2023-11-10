#!/bin/bash

huggingface-cli download TheBloke/vicuna-13B-v1.5-16K-GGUF vicuna-13b-v1.5-16k.Q4_K_M.gguf --local-dir llama.cpp/models --local-dir-use-symlinks False
