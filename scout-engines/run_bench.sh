#!/bin/bash

docker run --privileged \
       -v $(pwd)/wasm-engines/wasmfiles:/wasmfiles \
       -v $(pwd)/benchmark_results_data:/benchmark_results_data \
       -it scout-engines python3 /benchscript/scout_bignum_bench.py
