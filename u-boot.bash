#!/bin/bash
set -eo pipefail

if [ ! -f ./u-boot/Makefile ]; then
    git submodule update --init
fi

BOARD=$1
if [ -z $BOARD ]; then
    BOARD=pinebook-pro
fi

make -C ./u-boot ${BOARD}-rk3399_defconfig
make -C ./u-boot \
     -j8 PLAT=rk3399 \
     BL31=../bl31.elf \
     CFLAGS='-gdwarf-2' \
     M0_CROSS_COMPILE=arm-none-eabi- \
     CROSS_COMPILE=aarch64-unknown-linux-gnu- \
     u-boot.itb idbloader.img
cp ./u-boot/u-boot.itb ./u-boot/idbloader.img ./${BOARD}/
