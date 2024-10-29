#!/bin/bash

# Update package lists
sudo apt update

# Install Git and essential build tools
sudo apt install -y git build-essential

# Install Rust using the official installer
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source Cargo to make it available in the current session
source "$HOME/.cargo/env"

# Clone the repository
git clone https://github.com/tanishdt/shaipot.git

# Navigate into the cloned directory
cd shaipot

# Compile with Rust's optimized settings
cargo rustc --release -- -C opt-level=3 -C target-cpu=native -C codegen-units=1 -C debuginfo=0
