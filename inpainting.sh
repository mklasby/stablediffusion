#!/bin/bash
# "pregnacy announcment, mythical, christmas, religious, painting, jesus"
# PROMPT="mike and rachel getting married beautiful landscape mountains"
export INIT_IMAGE=./inputs/IMG_1137_small.jpg
export OUTDIR=./out
export CKPT=./models/v2-1_512-ema-pruned.ckpt
export SEED=42
export STEPS=50
export PORT=8000
export MAX_MESSAGE_SIZE=400

streamlit run \
 --server.port=${PORT} \
 --server.runOnSave=True \
 --server.maxMessageSize=${MAX_MESSAGE_SIZE} \
 scripts/streamlit/inpainting.py \
 configs/stable-diffusion/v2-inpainting-inference.yaml \
 ./models/512-inpainting-ema.ckpt

# ssh -L 8000:<streamlit server> mike@moraine -> Then open localhost:8000
