#! /usr/bin/env bash

set -e

repo="jwasinger"

docker build -t $repo/fizzy -f docker/fizzy.Dockerfile .
docker build -t $repo/life  -f docker/life.Dockerfile .
docker build -t $repo/ssvm -f  docker/ssvm.Dockerfile .
docker build -t $repo/wabt -f docker/wabt.Dockerfile .
docker build -t $repo/wagon -f docker/wagon.Dockerfile
docker build -t $repo/wamr -f docker/wamr.Dockerfile .
docker build -t $repo/wasm3 -f docker/wasm3.Dockerfile .
docker build -t $repo/wasmi -f docker/wasmi.Dockerfile .
docker build -t $repo/wasmtime -f docker/wasmtime.Dockerfile .
docker build -t $repo/wavm  -f docker/wavm.Dockerfile .
docker build -t $repo/bench -f docker/bench.Dockerfile
