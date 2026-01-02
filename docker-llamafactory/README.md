````markdown

# 🧠 What Capabilities Does This TuneFlow Project Have?

You have unintentionally built a true **enterprise-grade LLM platform**.

| Layer        | What You Already Have |
|-------------|------------------------|
| Hardware    | NVIDIA GPU             |
| Driver      | CUDA                   |
| Framework   | PyTorch                |
| Acceleration| FlashAttention / DeepSpeed |
| Dependencies| Hugging Face (HF) + Transformers |
| Deployment  | Docker                 |
| Orchestration | Docker Compose       |
| Persistence | Cache + Data + Output Volumes |
| API         | Gradio / OpenAI        |

This is already an **AI company-level architecture**.


# Docker Image and LLM Environment Setup

---

## 1. Image Files

### 1.1 `docker-compose.yml`

The `docker-compose.yml` file is used to build and manage the container.

**Build options:**

- When starting for the first time or when the image does not exist:
  ```bash
  docker compose up
````

(The image will be built automatically.)

* When restarting after source code or Dockerfile changes:

  ```bash
  docker compose up --build
  ```

* Build or rebuild the image only, without starting the service:

  ```bash
  docker compose build
  ```

* Docker uses build cache to speed up subsequent builds.
  To force a full rebuild:

  ```bash
  docker compose build --no-cache
  ```

---

### 1.2 `Dockerfile`

**Key point:**

* The base image comes from NVIDIA:
  `pytorch:25.08-py3`

---

### 1.3 Python Dependencies

The required Python libraries are defined in:

```
requirements.txt
```

---

### 1.4 Matching Torch, TorchVision, and CUDA Versions

Torch, TorchVision, and CUDA must have strictly matching versions.

First, check the CUDA version supported by your system:

```bash
nvcc --version
```

Then go to [https://pytorch.org](https://pytorch.org) to find the correct combination of Torch and TorchVision for your CUDA version.

Install Torch and TorchVision that match the current CUDA version:

```bash
pip3 install torch torchvision --index-url https://download.pytorch.org/whl/cu129
```

---

## 2. Start the Image

Start the container by building the image from the `Dockerfile`:

```bash
docker compose up --build
```

---

## 3. Verify the Installation

Enter the container:

```bash
sudo docker exec -it -u root myllamafactory /bin/bash
```

Run an LLM inference test using Hugging Face:

```bash
python -c "from transformers import pipeline; print(pipeline('sentiment-analysis')('hugging face is the best'))"
```

