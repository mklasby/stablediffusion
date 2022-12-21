FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel
# FROM nvcr.io/nvidia/pytorch:22.12-py3

SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]

ARG WORKSPACE_DIR=/home/user/stablediffusion

ENV NVIDIA_DRIVER_CAPABILITIES="all" \
    WORKSPACE_DIR=${WORKSPACE_DIR}

RUN mkdir -p ${WORKSPACE_DIR} \
    && apt-get update \
    && apt-get install -y git ssh tmux vim curl htop sudo libgl1

WORKDIR ${WORKSPACE_DIR}
COPY ./* ${WORKSPACE_DIR}/
RUN /opt/conda/bin/conda env update -n base -f environment.yaml
RUN conda init bash && exec bash
# ENTRYPOINT ["/usr/bin/env"]
# CMD ["bash"]
# CMD tail -f /dev/null


# from issues
# FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel

# RUN apt update && apt install --yes git ffmpeg libsm6 libxext6

# # Create conda environment
# RUN git clone https://github.com/Stability-AI/stablediffusion.git

# WORKDIR /workspace/stablediffusion/

# # Overwrite the environment.yaml file
# COPY environment.yaml .
# RUN conda env create -f environment.yaml

# # Make RUN commands use the new environment:
# SHELL ["conda", "run", "-n", "ldm", "/bin/bash", "-c"]

# # Install xformers for memory efficient flash attention
# RUN conda install xformers -c xformers/label/dev

# RUN conda init bash
# RUN echo "conda activate ldm" >> $HOME/.bashrc

# name: ldm
# channels:
#   - pytorch
#   - defaults
# dependencies:
#   # Changed to Python 3.9 to make use of precompiled binaries for xformers
#   - python=3.9
#   - pip
#   - cudatoolkit=11.3
#   - pytorch=1.12.1
#   - torchvision=0.13.1
#   - numpy=1.23.1
#   - pip:
#     - albumentations==1.3.0
#     - opencv-python==4.6.0.66
#     - imageio==2.9.0
#     - imageio-ffmpeg==0.4.2
#     - pytorch-lightning==1.4.2
#     - omegaconf==2.1.1
#     - test-tube>=0.7.5
#     - streamlit==1.12.1
#     - einops==0.3.0
#     - transformers==4.19.2
#     - webdataset==0.2.5
#     - kornia==0.6
#     - open_clip_torch==2.0.2
#     - invisible-watermark>=0.1.5
#     - streamlit-drawable-canvas==0.8.0
#     - torchmetrics==0.6.0
#     - -e .