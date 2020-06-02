FROM jwasinger/llvm-10:1.0

# install rust
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain 1.42.0 -y && . $HOME/.cargo/env
ENV PATH=/root/.cargo/bin:$PATH

RUN git clone --single-branch --branch bench-time https://github.com/ewasm-benchmarking/wasmi.git --recursive
RUN cd wasmi && cargo test --release
