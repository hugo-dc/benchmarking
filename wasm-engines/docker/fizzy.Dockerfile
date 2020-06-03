FROM jwasinger/llvm-10:1.0

# install fizzy
RUN git clone https://github.com/wasmx/fizzy.git --single-branch --branch master && \
    cd fizzy && mkdir build && cd build && cmake -DFIZZY_TESTING=ON .. && cmake --build .
