FROM wasm-engines/llvm:10

RUN git clone https://github.com/hugo-dc/wasm3.git --single-branch --branch benchmark
RUN cd wasm3 && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make
