#!/bin/bash

# Update and upgrade system packages
sudo apt update -y
sudo apt upgrade -y

# Install necessary packages
sudo apt install -y git curl cargo libssl-dev pkg-config build-essential cmake

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Set up the Rust environment
export PATH="$HOME/.cargo/bin:$PATH"

# Add ARM target for Rust
rustup target add aarch64-linux-android

# Set PKG_CONFIG_PATH to find OpenSSL
export PKG_CONFIG_PATH="/usr/lib/aarch64-linux-gnu/pkgconfig"

# Optionally, check if OpenSSL is installed
if pkg-config --exists openssl; then
    echo "OpenSSL is installed."
else
    echo "OpenSSL is not installed. Please check your installation."
    exit 1
fi

# Print the Rust and Cargo versions to verify installation
rustc --version
cargo --version
