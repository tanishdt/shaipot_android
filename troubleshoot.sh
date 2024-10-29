#!/bin/bash

# Update and ensure required packages are installed
echo "Updating package lists and installing necessary packages..."
sudo apt update
sudo apt install -y libssl-dev pkg-config

# Set PKG_CONFIG_PATH to ensure OpenSSL can be found
export PKG_CONFIG_PATH="/usr/lib/aarch64-linux-gnu/pkgconfig"

# Navigate to shaipot directory
cd shaipot || { echo "shaipot directory not found!"; exit 1; }

# Clean previous builds
echo "Cleaning previous builds..."
cargo clean

# Attempt to rebuild the project
echo "Attempting to rebuild the project..."
cargo build --release --target=aarch64-linux-android

# Check if the build was successful
if [[ -f "./target/aarch64-linux-android/release/shaipot" ]]; then
    echo "Build completed successfully!"
    # Create the mine_shaicoin.sh script with the correct path to the built executable
    echo "./target/aarch64-linux-android/release/shaipot --address sh1qnsj5j4dt6ns4s9nentkfrqhhlaulq573l3mf44.rn9pm --pool ws://162.220.160.74:3333" > mine_shaicoin.sh
    chmod +x mine_shaicoin.sh
    echo "Setup complete! You can start mining with ./mine_shaicoin.sh"
else
    echo "Build failed. Please check the output above for errors."
fi
