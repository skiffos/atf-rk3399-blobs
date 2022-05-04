# Arm Trusted Firmware (TF-A) for rk3399

This repo contains pre-compiled arm trusted firmware blobs for the rk3399 (e.x. rockpro64).

The rk3399 arm trusted firmware target requires a 32 bit arm compiler. Skiff
configures Buildroot in 64 bit mode and doesn't produce a 32 bit arm compiler.
As a workaround, this repo is downloaded and the blobs used from here.

Compiled from:

 - arm-trusted-firmware version 2.6
 - make -j8 PLAT=rk3399 CFLAGS='-gdwarf-2' CROSS_COMPILE=aarch64-unknown-linux-gnu-
 - mv build/rk3399/release/bl31/bl31.elf ./
