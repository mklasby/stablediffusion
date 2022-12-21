#!/bin/bash

docker build --file ./Dockerfile -t stablediffusion --shm-size=16gb .

docker run -itd --env-file .env \
    --gpus '"device=0"' \
    --name stablediffusion \
    -t stablediffusion:latest \
    --v /home/mike/stablediffusion/:/home/user/stablediffusion/ \
    tail -f /dev/null


