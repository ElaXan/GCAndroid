# Polycutter

Project is free to use. If you bought it from someone, please refund\
Join our [Discord](https://discord.gg/2TTSUZZ)

## Table of Contents
- [About](#about)
- [Prerequisites](#prerequisites)
  - [Android](#android)
  - [Windows](#windows)
  - [Linux](#linux)

## About

This is still under development, and may will return error while processing installing Grasscutter.

### What Can You Do with a Localhost Server?

* The lowest Ping possible.
* The ability to change the (Banners, Events, Abyss, and etc)
* Much more

## Prerequisites

Before you can use Polycutter, you need to set up the required environment based on your operating system.

### Android

To use Polycutter on your Android device, follow these steps:

1. **Install Termux**: If you haven't already, you can download and install [Termux](https://f-droid.org/repo/com.termux_118.apk) from F-Droid.

2. **Install Node.js**:
   ```bash
   pkg up -y
   pkg install nodejs -y
   ```

3. **Install Polycutter**:
   ```bash
   npm i -g polycutter
   ```

4. Once the installation is complete, you can start Polycutter by running the `polycutter` command.

### Windows

> :warning: Please note that `polycutter` has only been tested on Linux. Therefore, if you intend to use `polycutter` on Windows, you may encounter several errors. This is because some parts of the code rely on shell commands such as 'unzip.'

If you are using Windows, follow these steps to set up Polycutter:

1. **Install Node.js**: If you haven't already, download and install [Node.js](https://nodejs.org/en/download) for Windows.

2. **Install Polycutter**:
   ```bash
   npm install -g polycutter
   ```
   
Please make sure to consider potential compatibility issues when using `polycutter` on Windows.

### Linux

If you are using Linux, follow these steps to set up Polycutter:

1. **Install Node.js**: If you don't have Node.js installed on your Linux distribution, you can refer to [nodesource](https://github.com/nodesource/distributions) for installation instructions specific to your distribution.

2. **Install Polycutter**:
   ```bash
   npm i -g polycutter
   ```

Now that you've successfully set up Polycutter on your preferred platform.
