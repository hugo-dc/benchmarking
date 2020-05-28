#! /usr/bin/env bash
set -e

# (cd docker && \
# docker build -t jwasinger/base -f base.Dockerfile . && \
# docker build -t jwasinger/go-1-11-ubuntu-19 -f go-1-11-ubuntu-19.Dockerfile . && \
# docker build -t jwasinger/llvm:10 -f llvm-10.Dockerfile . && \
# docker build -t jwasinger/wabt -f wabt.Dockerfile . && \
# docker build -t jwasinger/wagon -f wagon.Dockerfile . && \
# docker build -t jwasinger/wavm -f wavm.Dockerfile . && \
# docker build -t jwasinger/life -f life.Dockerfile . && \
# docker build -t jwasinger/fizzy -f fizzy.Dockerfile .)
# docker build -t jwasinger/wasmtime -f wasmtime.Dockerfile .)
docker build -t jwasinger/bench -f docker/bench.Dockerfile .
