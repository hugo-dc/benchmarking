FROM jwasinger/base

RUN add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang-go
RUN export GO111MODULE=on

# install life
RUN git clone --single-branch --branch bench-times https://github.com/cdetrio/life
RUN cd life && go mod vendor
RUN cd life && go build
