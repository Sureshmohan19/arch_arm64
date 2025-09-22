.global _start
.align 2

.section __DATA, __data
    // 32-bit
    .align 2
    a32:    .word 0xF0F0F0F0
    b32:    .word 0x0FF00FF0
    result32_AND:   .word 0
    result32_OR:    .word 0
    result32_XOR:   .word 0

    // 64-bit
    .align 3
    a64:    .quad 0xFFFF0000AAAA5555
    b64:    .quad 0x1234567890ABCDEF
    result64_AND:   .quad 0
    result64_OR:    .quad 0
    result64_XOR:   .quad 0

.section __TEXT, __text
_start:
    // load a32 and b32
    adrp x0, a32@PAGE
    add x0, x0, a32@PAGEOFF
    ldr w1, [x0]
    adrp x0, b32@PAGE
    add x0, x0, b32@PAGEOFF
    ldr w2, [x0]

    // perform AND, OR, and XOR in 32-bit and store them
    and w3, w1, w2
    adrp x0, result32_AND@PAGE
    add x0, x0, result32_AND@PAGEOFF
    str w3, [x0]

    orr w3, w1, w2
    adrp x0, result32_OR@PAGE
    add x0, x0, result32_OR@PAGEOFF
    str w3, [x0]

    eor w3, w1, w2
    adrp x0, result32_XOR@PAGE
    add x0, x0, result32_XOR@PAGEOFF
    str w3, [x0]

    // load a64 and b64
    adrp x0, a64@PAGE
    add x0, x0, a64@PAGEOFF
    ldr x1, [x0]
    adrp x0, b64@PAGE
    add x0, x0, b64@PAGEOFF
    ldr x2, [x0]

    // perform AND, OR, and XOR on 64-bit and store them
    and x3, x1, x2
    adrp x0, result64_AND@PAGE
    add x0, x0, result64_AND@PAGEOFF
    str x3, [x0]

    orr x3, x1, x2
    adrp x0, result64_OR@PAGE
    add x0, x0, result64_OR@PAGEOFF
    str x3, [x0]

    eor x3, x1, x2
    adrp x0, result64_XOR@PAGE
    add x0, x0, result64_XOR@PAGEOFF
    str x3, [x0]

    // exit
    mov x0, #0
    movz x16, #0x1
    movk x16, #0x20, lsl #16
    svc #0