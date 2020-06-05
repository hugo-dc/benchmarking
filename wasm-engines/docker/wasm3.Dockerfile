FROM jwasinger/llvm-10:1.0

RUN git clone https://github.com/ewasm-benchmarking/wasm3.git --single-branch --branch benchmark && \
    cd wasm3 && mkdir build && cd build && cmake -DWASI=none -DCMAKE_BUILD_TYPE=Release .. && make -j4
