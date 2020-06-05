FROM ewasm/bench-base:1.0

# RUN add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang-go
# RUN export GO111MODULE=on

# install wagon
RUN git clone --single-branch --branch bench-times https://github.com/ewasm-benchmarking/wagon && \
    cd wagon/cmd/wasm-run && go build
