#!/bin/bash

LOGFILE="system_report.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "===== System Diagnostics: $(date) ====="

# OS Version
echo "[INFO] Detecting OS version..."
OS_VERSION=$(lsb_release -d | cut -f2)
echo "OS Version: $OS_VERSION"

# NVIDIA Driver & GPU
if command -v nvidia-smi &> /dev/null; then
    echo "[INFO] NVIDIA driver detected."
    nvidia-smi
    GPU_PRESENT=1
else
    echo "[WARNING] No NVIDIA GPU or driver detected."
    GPU_PRESENT=0
fi

# Docker Check
if command -v docker &> /dev/null; then
    echo "[INFO] Docker is installed."
    docker --version
else
    echo "[ERROR] Docker is not installed."
    exit 1
fi

# CUDA Toolkit Check
if command -v nvcc &> /dev/null; then
    echo "[INFO] CUDA toolkit installed."
    nvcc --version
else
    echo "[WARNING] CUDA toolkit not found."
fi

exit 0

