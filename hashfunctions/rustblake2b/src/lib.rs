extern crate blake2;
extern crate ewasm_api;

use blake2::{Blake2b, Digest};

#[no_mangle]
pub extern "C" fn main() {
    let data_size = ewasm_api::eth2::block_data_size();

    let block_data = ewasm_api::eth2::acquire_block_data();

    let mut output = [0u8; 32];

    // hash a total of 50kb
    let loop_iters = (50000 + (data_size - 1)) / data_size; // (data_size - 1)/data_size to round up

    for _i in 0..loop_iters {
        let mut hasher = Blake2b::default();
        hasher.input(&block_data);
        let hash = hasher.result();
    }


    let loop_iters_bytes = loop_iters.to_be_bytes();
    let mut post_root = [0u8; 32];
    post_root[0] = loop_iters_bytes[0];
    post_root[1] = loop_iters_bytes[1];
    post_root[2] = loop_iters_bytes[2];
    post_root[3] = loop_iters_bytes[3];

    let post_state_root = ewasm_api::types::Bytes32::from(&post_root);
    ewasm_api::eth2::save_post_state_root(&post_state_root)
}

