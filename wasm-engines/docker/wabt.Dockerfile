FROM jwasinger/llvm-10:1.0

RUN git clone --recursive --single-branch --branch bench-times https://github.com/jwasinger/wabt.git
RUN mkdir wabt/build && cd wabt/build && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF .. && make
