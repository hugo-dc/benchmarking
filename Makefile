all: build_docker_images evm_precompiles evm_engines scout_engines wasm_engines notebook

build_docker_images:
	cd evm/geth && docker build . -t geth-bench
	cd evm/parity && docker build . -t parity-bench
	cd evm/evmone && docker build . -t evmone-bench
	cd evm/cita-vm && docker build . -t cita-vm-bench
	docker pull jwasinger/bench
	cd scout-engines && docker build . -t scout-engines

evm_precompiles:
	cd evm/ && ./scripts/run_precompiles_bench.sh geth
	cd evm/ && ./scripts/run_precompiles_bench.sh parity

evm_engines:
	cd evm/ && ./scripts/run_bench.sh

scout_engines:
	cd scout-engines/ && ./run_bench.sh

wasm_engines:
	cd wasm-engines/ && run_benchmarks.sh

notebook:
	cd notebooks && jupyter nbconvert --execute --to notebook --inplace wasm-engines.ipynb

