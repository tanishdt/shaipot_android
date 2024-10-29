#!/bin/bash

# Update package lists
sudo apt update

# Install Git, build tools, OpenSSL, and other dependencies
sudo apt install -y git build-essential openssl libssl-dev

# Install Rust and Cargo (if not already installed)
if ! command -v cargo &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust is already installed."
fi

# Clone the shaipot repository
if [ ! -d "shaipot" ]; then
    git clone https://github.com/tanishdt/shaipot.git
else
    echo "shaipot repository already cloned."
fi

# Navigate into the repository directory
cd shaipot

# Compile with optimized settings
cargo rustc --release -- -C opt-level=3 -C target-cpu=native -C codegen-units=1 -C debuginfo=0

# Run the mining program (adjust as needed for your mining configuration)
./target/release/shaipot
