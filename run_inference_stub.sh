#!/bin/bash

set -e  # Exit on any error

# Step 1: Build (if needed)
docker build -t inference-stub .

# Step 2: Create data directory & copy input
mkdir -p ./data
cp input.json ./data/input.json

# Step 3: Run the container with mounted volume
docker run --rm -v "$(pwd)/data":/data inference-stub

# Step 4: Show results
echo -e "\n✅ Output:"
cat ./data/output.json

echo -e "\n📄 Logs:"
cat ./data/inference.log.jsonl

