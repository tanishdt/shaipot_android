# Shaipot Android Setup

This repository provides an automated setup script for mining Shaicoin on an Android device using UserLAnd. The `install.sh` script installs all necessary dependencies, sets up Rust for ARM architecture, clones the Shaipot repository, compiles it, and prepares a mining script.

## Prerequisites

- **UserLAnd** app installed on your Android device.
- Sufficient storage space and processing power for compiling and mining.

## Getting Started

### 1. Install the Script

You can easily download the `install.sh` script using `curl`. Open your terminal and run:

```bash
curl -LO https://raw.githubusercontent.com/tanishdt/shaipot_android/main/install.sh
```

### 2. Make the Script Executable

After downloading, you'll need to make the script executable. Run:

```bash
chmod +x install.sh
```

### 3. Run the Script

Now, you can run the script to begin the installation process:

```bash
./install.sh
```

### 4. Start Mining

After the setup is complete, you can start mining by running the generated script:

```bash
./shaipot/mine_shaicoin.sh
```

## Script Details

The `install.sh` script performs the following steps:

1. Updates and upgrades system packages.
2. Installs essential packages, including Git, Curl, and Cargo.
3. Installs Rust and configures it for ARM architecture.
4. Adds the ARM target for Rust (`aarch64-linux-android`).
5. Installs build essentials and CMake.
6. Builds the Shaipot project for the ARM target.
7. Clones the official Shaipot repository.
8. Creates a mining script (`mine_shaicoin.sh`) with the appropriate command.

## Troubleshooting

- **Permission Errors**: Ensure the script has executable permissions with `chmod +x install.sh`.
- **Low Memory**: Compilation may be resource-intensive; close other apps and processes if possible.
- **Rust or Cargo Not Found**: If Rust or Cargo is not found, source Rust by running `source $HOME/.cargo/env` before running the script.

## Contact

For any issues or questions, feel free to open an issue on the [repository](https://github.com/tanishdt/shaipot_android).

## License

This project is licensed under the MIT License.
