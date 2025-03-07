; filepath: bootloader.asm
bits 16
org 0x7C00

start:
    ; Set up the stack
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    ; Print "Hello, World!"
    mov si, hello_msg
print_char:
    lodsb
    cmp al, 0
    je done
    mov ah, 0x0E
    int 0x10
    jmp print_char

done:
    ; Hang the system
    cli
    hlt

hello_msg db 'Hello, World! - UltimateQuack', 0

times 510-($-$$) db 0
dw 0xAA55
