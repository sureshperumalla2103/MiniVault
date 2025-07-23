# MiniVault Bootstrap Prototype

This is a basic system bootstrap simulation for **ModelVault**, a plug-and-play AI appliance for running local LLM and vision model inference.

Built to run on Ubuntu 22.04 (or WSL), it covers system diagnostics, Docker-based inference simulation, structured logging, and optional GPU monitoring.

---

## 📦 Contents

- `diagnose.sh` — System diagnostics for OS, GPU, Docker, and CUDA
- `Dockerfile` + `inference_stub.sh` — Simulated model container
- `run_inference_stub.sh` — Wrapper to build, run, and view results
- `input.json` — Example prompt and model parameters
- `gpu_health.sh` — Optional script for GPU telemetry (JSON output)
- `data/` — Auto-created folder for mounted input/output/log files

---

## 🛠️ Requirements

- **OS**: Ubuntu 22.04 LTS or WSL ( as i am currently using Windows personal laptop for this activity using WSL )
- **Docker**: Installed and working (`docker --version` )


---

## 🚀 How to Use

### 1. Run Diagnostics

```bash
chmod +x diagnose.sh
./diagnose.sh

