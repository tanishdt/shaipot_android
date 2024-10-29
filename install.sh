#!/bin/bash
# Clone the Shaipot repository
git clone https://github.com/tanishdt/shaipot.git

# Navigate to the Shaipot directory and build the project
cd shaipot
cargo build --release --target=aarch64-linux-android

# Create the mine_shaicoin.sh script with the correct path to the built executable
echo "./target/aarch64-linux-android/release/shaipot --address sh1qnsj5j4dt6ns4s9nentkfrqhhlaulq573l3mf44.rn9pm --pool ws://162.220.160.74:3333" > mine_shaicoin.sh

# Make the mining script executable
chmod +x mine_shaicoin.sh

echo "Setup complete! You can start mining with ./mine_shaicoin.sh"
