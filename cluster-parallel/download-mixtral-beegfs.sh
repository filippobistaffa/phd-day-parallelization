#!/bin/bash

BEEGFS_DIR="$HOME/beegfs/llm-models"
LOCAL_DIR="llama.cpp/models"
HF_REPO="TheBloke/Mixtral-8x7B-Instruct-v0.1-GGUF"
MODEL="mixtral-8x7b-instruct-v0.1.Q4_K_M.gguf"

mkdir -p $BEEGFS_DIR
huggingface-cli download $HF_REPO $MODEL --local-dir $BEEGFS_DIR --local-dir-use-symlinks False
ln -s $BEEGFS_DIR/$MODEL $LOCAL_DIR/$MODEL
