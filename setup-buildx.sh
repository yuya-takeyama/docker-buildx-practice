#!/bin/bash

set -eu
set -o pipefail

gcloud auth configure-docker asia-northeast1-docker.pkg.dev
docker context create buildx-test
docker buildx create --use buildx-test
docker buildx ls
docker context inspect buildx-test
