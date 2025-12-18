#!/bin/bash

set -e

targets=(
  "invictus_api"
  "invictus_android"
  "invictus_darwin"
  "invictus"
)

publish() {
  local target=$1

  flutter pub publish --dry-run --directory=$target
}

if [ -n "$1" ]; then
  publish "$1"
else
  for target in "${targets[@]}"; do
    publish "$target"
  done
fi