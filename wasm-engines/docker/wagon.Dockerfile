FROM jwasinger/go-1-11-ubuntu-19

# install wagon
RUN git clone --single-branch --branch bench-times https://github.com/cdetrio/wagon
RUN cd wagon/cmd/wasm-run && go build
