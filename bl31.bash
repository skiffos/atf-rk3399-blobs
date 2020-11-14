#!/bin/bash

if [ ! -f ./arm-trusted-firmware/Makefile ]; then
    git submodule update --init
fi

make -C ./arm-trusted-firmware \
     -j8 PLAT=rk3399 \
     CFLAGS='-gdwarf-2' \
     M0_CROSS_COMPILE=arm-none-eabi- \
     CROSS_COMPILE=aarch64-unknown-linux-gnu-
mv ./arm-trusted-firmware/build/rk3399/release/bl31/bl31.elf ./
