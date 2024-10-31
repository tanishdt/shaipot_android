#!/bin/bash

# Update and upgrade the package list
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install -y build-essential pkg-config libssl-dev git curl

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Source the Cargo environment to update the current shell session
source $HOME/.cargo/env

