all: bl31.elf rockpro64/u-boot.itb pinebook-pro/u-boot.itb

bl31.elf:
	bash ./build.bash

pinebook-pro/u-boot.itb: bl31.elf
	bash ./u-boot.bash pinebook-pro

rockpro64/u-boot.itb: bl31.elf
	bash ./u-boot.bash rockpro64
