#!/bin/bash

LOCAL_DIR="llama.cpp/models"
HF_REPO="TheBloke/vicuna-13B-v1.5-16K-GGUF"
MODEL="vicuna-13b-v1.5-16k.Q4_K_M.gguf"

huggingface-cli download $HF_REPO $MODEL --local-dir $LOCAL_DIR --local-dir-use-symlinks False
