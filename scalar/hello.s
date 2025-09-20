.global _start
.align 2

.section __TEXT, __data
msg:
    .asciz "Hello, MacOS!\n"

.section __TEXT, __text
_start:
    // write
    mov x0, #1
    adrp x1, msg@PAGE
    add x1, x1, msg@PAGEOFF
    mov x2, #14

    // syscall for writing
    movz x16, #0x4
    movk x16, #0x20, lsl #16
    svc #0

    // exit
    mov x0, #0
    movz x16, #0x1
    movk x16, #0x20, lsl #16
    svc #0