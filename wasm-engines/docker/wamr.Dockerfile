FROM wasm-engines/llvm:10

RUN git clone https://github.com/hugo-dc/wasm-micro-runtime.git --single-branch --branch benchmark
RUN cd wasm-micro-runtime && git pull origin benchmark
## Build LLVM
RUN cd wasm-micro-runtime/product-mini/platforms/linux && ./build_llvm.sh 
## Build JIT
RUN cd wasm-micro-runtime/product-mini/platforms/linux && ./build_jit.sh 
## Build Interpreter
RUN cd wasm-micro-runtime/product-mini/platforms/linux && mkdir build_interp && cd build_interp && cmake -DWAMR_BUILD_INTERP=1 .. -DCMAKE_BUILD_TYPE=Release .. && make
