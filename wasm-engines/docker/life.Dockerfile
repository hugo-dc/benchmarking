FROM wasm-engines/base

RUN add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang-go
RUN export GO111MODULE=on

# Install Clang 8 (needed for life -polymerase)
RUN apt update && apt install -y clang-8 lldb-8 lld-8

RUN ln -s /usr/bin/clang-8 /usr/bin/clang && \
    ln -s /usr/bin/clang++-8 /usr/bin/clang++

# install life
RUN git clone --single-branch --branch bench-times https://github.com/cdetrio/life
RUN cd life && go mod vendor
RUN cd life && go build
