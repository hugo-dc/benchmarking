FROM jwasinger/base

RUN add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get install -y golang-go
RUN export GO111MODULE=on
