#!/bin/bash

# Update and upgrade the package list
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install -y build-essential pkg-config libssl-dev git curl

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Source the Cargo environment to update the current shell session
source $HOME/.cargo/env

# Clone the Shaipot repository
git clone https://github.com/shaicoin/shaipot.git

# Change directory to the shaipot folder
cd shaipot

# Compile Shaipot
cargo rustc --release -- -C opt-level=3 -C target-cpu=native -C codegen-units=1 -C debuginfo=0

echo "Shaipot installation and compilation completed successfully!"
echo "You can run the miner using the following command:"
echo "./target/release/shaipot --address YOUR_SHAICOIN_ADDRESS --pool YOUR_POOL_URL
