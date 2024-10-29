#!/bin/bash

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update
sudo apt upgrade -y

# Install necessary packages
echo "Installing necessary packages..."
sudo apt install -y git curl cargo libssl-dev pkg-config build-essential cmake

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env  # Ensure Rust is in the environment

# Add ARM target for Rust
echo "Adding ARM target for Rust..."
rustup target add aarch64-linux-android

# Set PKG_CONFIG_PATH to find OpenSSL
export PKG_CONFIG_PATH="/usr/lib/aarch64-linux-gnu/pkgconfig"

# Clone the Shaipot repository
echo "Cloning the Shaipot repository..."
git clone https://github.com/tanishdt/shaipot.git

# Navigate to the Shaipot directory
cd shaipot || { echo "Failed to navigate to shaipot directory!"; exit 1; }

# Build the project
echo "Building the Shaipot project..."
cargo build --release --target=aarch64-linux-android

# Check if the build was successful
if [[ -f "./target/aarch64-linux-android/release/shaipot" ]]; then
    # Create the mine_shaicoin.sh script with the correct path to the built executable
    echo "./target/aarch64-linux-android/release/shaipot --address sh1qnsj5j4dt6ns4s9nentkfrqhhlaulq573l3mf44.rn9pm --pool ws://162.220.160.74:3333" > mine_shaicoin.sh
    
    # Make the mining script executable
    chmod +x mine_shaicoin.sh
    
    echo "Setup complete! You can start mining with ./mine_shaicoin.sh"
else
    echo "Build failed. Please check the output above for errors."
    exit 1
fi
