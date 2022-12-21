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