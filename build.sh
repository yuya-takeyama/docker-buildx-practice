#!/bin/bash

set -eu
set -o pipefail



IMAGE="asia-northeast1-docker.pkg.dev/jp-yuyat-buildx-test/node-app/node-app"
CACHE_IMAGE="asia-northeast1-docker.pkg.dev/jp-yuyat-buildx-test/node-app/node-app/cache"

docker buildx build -f Dockerfile -t "$IMAGE:latest" . --push --progress plain \
  --cache-to "type=registry,mode=max,ref=$CACHE_IMAGE:cache" \
  --cache-from "type=registry,ref=$CACHE_IMAGE:cache"
