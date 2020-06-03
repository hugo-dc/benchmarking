FROM jwasinger/bench-base:1.0

RUN git clone --single-branch --branch bench-time https://github.com/ewasm-benchmarking/wasmi.git --recursive && \
    cd wasmi && cargo build --release
