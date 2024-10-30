#!/bin/bash

# Update package list and upgrade installed packages
echo "Updating package list and upgrading installed packages..."
sudo apt update && sudo apt upgrade -y

# Install essential build tools
echo "Installing essential build tools..."
sudo apt install -y build-essential pkg-config

# Install OpenSSL development libraries
echo "Installing OpenSSL development libraries..."
sudo apt install -y libssl-dev

# Install Git
echo "Installing Git..."
sudo apt install -y git

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Source the cargo environment
echo "Please run 'source \$HOME/.cargo/env' to configure Rust in your shell."

# Clone the Shaipot repository
echo "Cloning the Shaipot repository..."
git clone https://github.com/shaicoin/shaipot.git

# Compile Shaipot
echo "Compiling Shaipot..."
cd shaipot || { echo "Failed to navigate to shaipot directory"; exit 1; }
cargo rustc --release -- -C opt-level=3 -C target-cpu=native -C codegen-units=1 -C debuginfo=0

# Completion message
echo "Shaipot installation and compilation completed successfully!"
echo "You can run the miner using the following command:"
echo "./target/release/shaipot --address YOUR_SHAICOIN_ADDRESS --pool YOUR_POOL_URL --threads \$(nproc)"
