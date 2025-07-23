#!/bin/bash

if ! command -v nvidia-smi &> /dev/null; then
  echo "{\"timestamp\":\"$(date -Iseconds)\",\"level\":\"ERROR\",\"component\":\"gpu-monitor\",\"message\":\"nvidia-smi not found\"}"
  exit 1
fi

nvidia-smi --query-gpu=temperature.gpu,memory.total,memory.used,utilization.gpu \
  --format=csv,noheader,nounits | \
while IFS=',' read -r temp total used util; do
  echo "{\"timestamp\":\"$(date -Iseconds)\",\"temperature_c\":${temp// /},\"memory_total_mb\":${total// /},\"memory_used_mb\":${used// /},\"gpu_utilization_pct\":${util// /}}"
done

