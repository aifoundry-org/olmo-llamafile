# Description

*Allows to convert gguf-ed LMMs to llamafile and upload them to public HF repo*
*You can do that from your local machine and from GitHub Actions*

# Up and running

## Preparation

1. Create HF repo
2. Create Access Key with write permission and save it somewhere

## Upload from local machine

1. Create `.env` file and set there corresponding vars:

```sh
cp .env.example .env
```

2. Up container

```sh
docker compose up -d olmo
```

3. Copy gguf-ed model

```sh
docker cp OLMo-1.7-7B-hf.Q8_0.gguf llfiler-olmo-1:/app/
```

4. Connect to container shell

```sh
docker exec -it llfiler-olmo-1 /bin/bash
```

5. Convert ggufed model to llamafile:

```sh
llamafile-0.8.6/bin/llamafile-convert OLMo-1.7-7B-hf.Q8_0.gguf
```

6. Upload to HF:

```sh
huggingface-cli upload "$HF_REPO" "$HF_REPO_FILE"
```

## Upload from repository

1. Copy `.github/workflows/prototype.yml` workflow to your repo
2. Add secret `HF_TOKEN` to your repo secrets
3. Add repo variable `HF_REPO`, `HF_REPO_FILE`, `REMOTE_GGUF_MODEL` for your repo variables (where `REMOTE_GGUF_MODEL` is a link to download gguf model via `curl`)