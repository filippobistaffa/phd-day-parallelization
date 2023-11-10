#!/bin/bash

BEEGFS_DIR="$HOME/beegfs/llm-models"
LOCAL_DIR="llama.cpp/models"

mkdir -p $BEEGFS_DIR
huggingface-cli download TheBloke/vicuna-13B-v1.5-16K-GGUF vicuna-13b-v1.5-16k.Q4_K_M.gguf --local-dir $BEEGFS_DIR --local-dir-use-symlinks False
ln -s $BEEGFS_DIR/vicuna-13b-v1.5-16k.Q4_K_M.gguf $LOCAL_DIR/vicuna-13b-v1.5-16k.Q4_K_M.gguf
