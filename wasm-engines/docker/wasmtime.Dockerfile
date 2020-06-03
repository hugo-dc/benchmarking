FROM jwasinger/bench-base:1.0

RUN git clone --single-branch --branch bench-times https://github.com/ewasm-benchmarking/wasmtime.git
RUN cd wasmtime && cargo build --release
