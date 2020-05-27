FROM wasm-engines/base

RUN echo "deb http://apt.llvm.org/eoan/ llvm-toolchain-eoan-10 main\
deb-src http://apt.llvm.org/eoan/ llvm-toolchain-eoan-10 main" >> /etc/apt/sources.list

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add - && apt update -y && apt install -y clang-10 lldb-10 lld-10

RUN ln -s /usr/bin/clang++-10  /usr/bin/clang++
RUN ln -s /usr/bin/clang-10  /usr/bin/clang

ENV CC=clang
ENV CXX=clang++
