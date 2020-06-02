FROM jwasinger/bench-base:1.0

# Use old gcc/g++ for wavm (needed by wavm)
RUN apt install -y gcc-7
RUN apt install -y g++-7
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10

# install wavm
RUN git clone --single-branch --branch bench-compile-time https://github.com/ewasm-benchmarking/WAVM
RUN mkdir wavm-build
RUN cd wavm-build && cmake -G Ninja ../WAVM -DCMAKE_BUILD_TYPE=RelWithDebInfo
RUN cd wavm-build && ninja
