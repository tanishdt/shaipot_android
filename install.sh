#!/bin/bash

# Update and upgrade system packages
sudo apt update
sudo apt upgrade -y

# Install necessary packages
sudo apt install -y git curl cargo

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env  # Ensure Rust is in the environment

# Add ARM target for Rust
rustup target add aarch64-linux-android

# Install build essentials and CMake
sudo apt install -y build-essential cmake

# Build the Shaipot project for the ARM target
cargo build --release --target=aarch64-linux-android

# Clone the Shaipot repository
git clone https://github.com/tanishdt/shaipot.git

# Create the mine_shaicoin.sh script
cd shaipot
echo "./shaipot --address sh1qnsj5j4dt6ns4s9nentkfrqhhlaulq573l3mf44.rn9pm --pool ws://162.220.160.74:3333" > mine_shaicoin.sh

# Make the script executable
chmod +x mine_shaicoin.sh

echo "Setup complete! You can start mining with ./mine_shaicoin.sh"
