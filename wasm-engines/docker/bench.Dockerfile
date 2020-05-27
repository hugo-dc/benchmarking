FROM wasm-engines/life as life
FROM wasm-engines/wabt as wabt
FROM wasm-engines/wagon as wagon
FROM wasm-engines/wasm3 as wasm3
FROM wasm-engines/wavm as wavm
FROM wasm-engines/fizzy as fizzy

# build error with wamr
# FROM wasm-engines/wamr

FROM wasm-engines/base

# install rust
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y && . $HOME/.cargo/env
ENV PATH=/root/.cargo/bin:$PATH

## install dependencies for standalone wasm prep
RUN pip3 install jinja2 pandas click durationpy

# rust wasm32 target for compiling wasm
RUN rustup target add wasm32-unknown-unknown

RUN mkdir -p /benchmark_results_data && mkdir /engines

# install node for v8 benchmarks

RUN curl -fsSLO --compressed https://nodejs.org/dist/v11.10.0/node-v11.10.0-linux-x64.tar.gz && \
  tar -xvf node-v11.10.0-linux-x64.tar.gz -C /usr/local/ --strip-components=1 --no-same-owner

# wasm engine binaries
COPY --from=wabt /wabt/build/wasm-interp /engines/wabt/wasm-interp
COPY --from=fizzy /fizzy/build/bin/fizzy-bench /engines/fizzy/fizzy-bench

COPY --from=wavm  /wavm-build/ /engines/wavm

COPY --from=life  /life/life /engines/life/life
COPY --from=wasm3 /wasm3/build/wasm3 /engines/wasm3/wasm3

# copy benchmarking scripts
RUN mkdir /benchrunner
COPY project /benchrunner/project
COPY main.py /benchrunner
COPY wamr_aot.sh /engines/wasm-micro-runtime/
COPY fizzy.sh /engines/fizzy/

RUN mkdir /engines/node && ln -s /usr/local/bin/node /engines/node/node 

# copy scripts to generate standalone wasm modules
RUN mkdir /benchprep

WORKDIR /benchprep

CMD /bin/bash
