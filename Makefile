all: bl31.elf u-boot.itb

bl31.elf:
	bash ./build.bash

u-boot.itb: bl31.elf
	bash ./u-boot.bash
