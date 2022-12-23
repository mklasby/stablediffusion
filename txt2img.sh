#!/bin/bash

export OUTDIR=./out
export CKPT=./models/v2-1_512-ema-pruned.ckpt
export SEED=42
export STEPS=50
echo $PROMPT
python ./scripts/txt2img.py \
--prompt "a cartoon sketch of a pregnancy announcement, diffuse lighting, unity, baby, christmas" \
--outdir ${OUTDIR} \
--ckpt=${CKPT} \
--steps=${STEPS} \
--neg-prompt "ugly, sad, deformed"
