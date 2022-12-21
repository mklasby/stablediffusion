#!/bin/bash

export PROMPT=a dog riding a rocket to the moon by salvador dali
export OUTDIR=./out
export CKPT=./models/v2-1_512-ema-pruned.ckpt
export SEED=42
export STEPS=1000       
python ./scripts/txt2img.py \
    --prompt ${PROMPT} \
    --outdir ${OUTDIR} \
    --ckpt=${CKPT} \
    --steps=${STEPS}
