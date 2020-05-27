#! /usr/bin/env bash
set -e

docker build -t wasm-engines/base -f base.Dockerfile .
docker build -t wasm-engines/go-1-11-ubuntu-19 -f go-1-11-ubuntu-19.Dockerfile .
docker build -t wasm-engines/llvm:10 -f llvm-10.Dockerfile .
docker build -t wasm-engines/wabt -f wabt.Dockerfile .
docker build -t wasm-engines/wagon -f wagon.Dockerfile .
docker build -t was-engines/wavm -f wavm.Dockerfile .
docker build -t wasm-engines/life -f life.Dockerfile .
