FROM jwasinger/llvm:10

# install fizzy
RUN git clone https://github.com/wasmx/fizzy.git --single-branch --branch master
RUN cd fizzy && mkdir build && cd build && cmake -DFIZZY_TESTING=ON .. && cmake --build .
