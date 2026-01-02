#!/bin/bash
docker build -t pytorch-gpu-demo .
docker run --gpus all pytorch-gpu-demo

