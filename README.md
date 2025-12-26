# AMD ISP4 Camera Module Installation

Enables the AMD ISP4 camera on systems with AMD Ryzen AI processors.

## Prerequisites

Install kernel headers and build tools:

```bash
# Arch
sudo pacman -S base-devel linux-headers

# Ubuntu/Debian
sudo apt install build-essential linux-headers-$(uname -r)

# Fedora
sudo dnf install kernel-devel kernel-headers gcc make
```

## Install

```bash
make
sudo make install
```

## Rebuild after kernel update

```bash
make clean
make
sudo make install
```
