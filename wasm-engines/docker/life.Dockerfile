FROM jwasinger/bench-base:1.0

RUN add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang-go
RUN export GO111MODULE=on

# install life
RUN git clone --single-branch --branch bench-times https://github.com/ewasm-benchmarking/life
RUN cd life && go mod vendor
RUN cd life && go build
