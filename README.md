# Description

*Allows to llamifile (currently only gguf-ed) models and upload them to Huggingface repo*

# Up and running

1. Create HF repo
2. Create Access Key with write permission
3. Create `.env` file and set there corresponding vars:

```sh
cp .env.example .env
```

4. Up container

```sh
docker compose up -d olmo
```

5. Copy gguf-ed model

```sh
docker cp <ggufed_model> llfiler-olmo-1:/app
```

6. Connect to container shell

```sh
docker exec -it llfiler-olmo-1 /bin/bash
```

7. Convert ggufed model to llamafile:

```sh
llamafile-0.8.6/bin/llamafile-convert OLMo-1.7-7B-hf.Q8_0.gguf
```

8. Upload to HF:

```sh
huggingface-cli upload "$HF_REPO" "$HF_REPO_FILE"
```