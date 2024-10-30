# Shaipot - Shaicoin Miner for Android

Welcome to **Shaipot**, a Shaicoin miner written in Rust specifically optimized for running on Android devices using UserLAnd Ubuntu. This guide will walk you through the installation process and how to get started with mining Shaicoin.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
  - [One-Click Installer](#one-click-installer)
  - [Manual Installation](#manual-installation)
- [Running the Miner](#running-the-miner)
- [Usage Example](#usage-example)
- [Contributing](#contributing)
- [License](#license)

## Features
- Efficient and fast mining capabilities.
- Multi-threaded support for optimal CPU utilization.
- Minimal setup required for beginners.

## Requirements
- An Android device with UserLAnd installed.
- Basic knowledge of terminal commands.
- A valid Shaicoin address and a mining pool URL.

## Installation

### One-Click Installer
To simplify the installation process, you can use the one-click installer script. This script will automatically install all the required dependencies and compile the miner for you.

1. **Open Your Terminal in UserLAnd**.
2. **Run the following command to execute the installer script**:

   ```bash
   curl -sSL https://raw.githubusercontent.com/tanishdt/shaipot_android/main/install.sh | bash
   ```

3. **Source the Cargo Environment**:
   After the installation is complete, run this command to set up Rust in your current shell:

   ```bash
   source $HOME/.cargo/env
   ```

### Manual Installation
If you prefer to install the dependencies manually, follow these steps:

1. **Update Package List**:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Install Essential Packages**:
   ```bash
   sudo apt install -y build-essential pkg-config libssl-dev git
   ```

3. **Install Rust**:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

4. **Clone the Shaipot Repository**:
   ```bash
   git clone https://github.com/shaicoin/shaipot.git
   cd shaipot
   ```

5. **Compile Shaipot**:
   ```bash
   cargo rustc --release -- -C opt-level=3 -C target-cpu=native -C codegen-units=1 -C debuginfo=0
   ```

## Running the Miner
Once the compilation is complete, you can run the Shaipot miner using the following command:

```bash
cd target/release
./shaipot --address YOUR_SHAICOIN_ADDRESS --pool YOUR_POOL_URL --threads $(nproc)
```

Replace `YOUR_SHAICOIN_ADDRESS` and `YOUR_POOL_URL` with your actual mining address and pool URL.

## Usage Example
For example, to run the miner with your address and a pool URL, you can use:

```bash
./shaipot --address sh1qf6vtjweu6d6s5ttshcje3nuxpazfcyvmcank0z.rn10 --pool ws://162.220.160.74:3333 --threads $(nproc)
```

## Contributing
Contributions are welcome! If you have suggestions for improvements or bug fixes, feel free to submit a pull request or open an issue.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Happy Mining!
