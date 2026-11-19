#!/bin/bash
set -xe

QEMU=qemu-system-riscv32
CC=clang
CFLAGS="-O0 -g -pedantic -Wall -Wextra --target=riscv32-unknown-elf32 -fuse-ld=lld -ffreestanding -fno-builtin -nostdlib"
LFLAGS="-Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf kernel.S"

$CC $CFLAGS $LFLAGS


$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot
