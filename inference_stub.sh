#!/bin/bash

INPUT="/data/input.json"
OUTPUT="/data/output.json"
LOG="/data/inference.log.jsonl"

timestamp() {
  date -Iseconds
}

if [[ ! -f "$INPUT" ]]; then
  echo "{\"timestamp\":\"$(timestamp)\",\"level\":\"ERROR\",\"component\":\"inference\",\"message\":\"Missing input.json\"}" >> "$LOG"
  exit 1
fi

echo "{\"timestamp\":\"$(timestamp)\",\"level\":\"INFO\",\"component\":\"inference\",\"message\":\"Inference stub started\"}" >> "$LOG"

sleep 2  # simulate processing

jq '. + {"response": "Stub result"}' "$INPUT" > "$OUTPUT"

echo "{\"timestamp\":\"$(timestamp)\",\"level\":\"INFO\",\"component\":\"inference\",\"message\":\"Model processing completed\",\"model\":\"test-model-v1\",\"duration_ms\":2000}" >> "$LOG"

