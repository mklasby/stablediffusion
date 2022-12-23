#!/bin/bash
# "pregnacy announcment, mythical, christmas, religious, painting, jesus"
# PROMPT="mike and rachel getting married beautiful landscape mountains"
export INIT_IMAGE=./inputs/IMG_1137_small.jpg
export OUTDIR=./out
export CKPT=./models/v2-1_512-ema-pruned.ckpt
export SEED=42
export STEPS=50
export PORT=8000

streamlit run --server.port=${PORT} scripts/streamlit/depth2img.py configs/stable-diffusion/v2-midas-inference.yaml ./models/512-depth-ema.ckpt

# ssh -L 8000:<streamlit server> mike@moraine -> Then open localhost:8000
# \
# --prompt "a cartoon sketch of a pregnancy announcement, beautiful, happy, pretty, handsome, christmas" \
# --outdir ${OUTDIR} \
# --init-img ${INIT_IMAGE} \
# --ckpt=${CKPT} \
# --ddim_steps=${STEPS} \
# --strength 0.7 \
# --neg-prompt  "ugly, deformed, bad anatomy, bad hands, crowd, sad"
