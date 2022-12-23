#!/bin/bash
# "pregnacy announcment, mythical, christmas, religious, painting, jesus"
# PROMPT="mike and rachel getting married beautiful landscape mountains"
export INIT_IMAGE=./inputs/IMG_1137_small.jpg
export OUTDIR=./out
export CKPT=./models/v2-1_512-ema-pruned.ckpt
export SEED=8888
export STEPS=500

python ./scripts/img2img.py \
--prompt "an oil painting of a pregnancy announcement, baby, christmas, salvador dali" \
--outdir ${OUTDIR} \
--init-img ${INIT_IMAGE} \
--ckpt=${CKPT} \
--ddim_steps=${STEPS} \
--seed ${SEED} \
--strength 0.675 \
--neg-prompt  "ugly, deformed, bad anatomy, bad hands, crowd, sad"
