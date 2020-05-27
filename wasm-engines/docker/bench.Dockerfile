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

RUN mkdir -p /benchmark_results_data

# wasm engine binaries
COPY --from=wabt /wabt/build/wasm-interp /usr/bin/wasm-interp

# copy benchmarking scripts
RUN mkdir /benchrunner
COPY project /benchrunner/project
COPY main.py /benchrunner
COPY wamr_aot.sh /engines/wasm-micro-runtime/
COPY fizzy.sh /engines/fizzy/

RUN echo "asdf"

# copy scripts to generate standalone wasm modules
RUN mkdir /benchprep
COPY benchnativerust_prepwasm.py /benchprep
COPY nanodurationpy.py /benchprep
COPY rust-code /benchprep/rust-code
COPY inputvectors /benchprep/inputvectors
COPY benchmeteredstandalone.sh /benchprep
RUN chmod +x /benchprep/benchmeteredstandalone.sh
COPY bench_wasm_and_native.sh /benchprep
RUN chmod +x /benchprep/bench_wasm_and_native.sh

WORKDIR /benchprep

CMD /bin/bash
