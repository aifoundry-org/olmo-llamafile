FROM ubuntu:latest

ARG LLAMAFILE_RELEASE

WORKDIR /app

RUN apt update && \
    apt install -y git curl unzip git-lfs python3 python3-pip && \
    pip3 install --break-system-packages -U "huggingface_hub[cli]" && \
    curl -L ${LLAMAFILE_RELEASE} -o llamafile.zip && \ 
    unzip llamafile.zip && \ 
    rm -rf llamafile.zip && \
    mv $(ls | grep llamafile-) llamafile

CMD ["sleep", "infinity"]