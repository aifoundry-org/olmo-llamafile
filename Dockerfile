FROM ubuntu:latest

WORKDIR /app

RUN apt update && apt install -y git curl unzip git-lfs python3 python3-pip && pip3 install --break-system-packages -U "huggingface_hub[cli]" && curl -L https://github.com/Mozilla-Ocho/llamafile/releases/download/0.8.6/llamafile-0.8.6.zip -O && unzip llamafile-0.8.6.zip && rm -rf llamafile-0.8.6.zip

CMD ["sleep", "infinity"]