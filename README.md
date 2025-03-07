# helloass
Hello, World! in Assembly! Tested with QEMU

## Usage

```
nasm -f bin -o bootloader.bin bootloader.asm

dd if=/dev/zero of=bootloader.img bs=512 count=1
dd if=bootloader.bin of=bootloader.img conv=notrunc

qemu-system-x86_64 -drive format=raw,file=bootloader.img
```
