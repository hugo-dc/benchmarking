#! /usr/bin/env bash
set -e

docker build -t wasm-engines/base -f Dockerfile.base .
docker build -t wasm-engines/golang:1.11 -f Dockerfile.golang-1-11 .
docker build -t wasm-engines/llvm:10 -f Dockerfile.llvm-10 .
docker build -t wasm-engines/wabt -f Dockerfile.wabt .
docker build -t wasm-engines/wagon -f Dockerfile.wagon .
docker build -t was-engines/wavm -f Dockerfile.wavm .
docker build -t wasm-engines/life -f Dockerfile.life .
