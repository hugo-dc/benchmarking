FROM wasm-engines/golang:1.11

# install wagon
RUN git clone --single-branch --branch bench-times https://github.com/cdetrio/wagon
RUN cd wagon/cmd/wasm-run && go build
