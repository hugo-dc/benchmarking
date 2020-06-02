FROM jwasinger/llvm-10:1.0

ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

RUN git clone https://github.com/ewasm-benchmarking/wasm-micro-runtime.git --single-branch --branch benchmark
RUN cd wasm-micro-runtime && git pull origin benchmark
## Build LLVM
RUN cd wasm-micro-runtime/product-mini/platforms/linux && ./build_llvm.sh 
## Build JIT
RUN cd wasm-micro-runtime/product-mini/platforms/linux && ./build_jit.sh 
## Build Interpreter
RUN cd wasm-micro-runtime/product-mini/platforms/linux && mkdir build_interp && cd build_interp && cmake -DWAMR_BUILD_INTERP=1 .. -DCMAKE_BUILD_TYPE=Release .. && make -j4
## Build Compiler
RUN cd wasm-micro-runtime/wamr-compiler && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make
