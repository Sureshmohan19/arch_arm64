.global _start
.align 2

.section __DATA, __data
    a32:    .word 30
    b32:    .word 20
    a64:    .quad 1234567890
    b64:    .quad 9876543210
    result32:   .word 0
    result64:   .quad 0

.section __TEXT, __text
_start:
    //load a32 to w1
    adrp x0, a32@PAGE
    add x0, x0, a32@PAGEOFF
    ldr w1, [x0]

    // load b32 to w2
    adrp x0, b32@PAGE
    add x0, x0, b32@PAGEOFF
    ldr w2, [x0]

    // sub
    sub w3, w1, w2

    // store result to result32
    adrp x0, result32@PAGE
    add x0, x0, result32@PAGEOFF
    str w3, [x0]

    // load a64 to x1
    adrp x0, a64@PAGE
    add x0, x0, a64@PAGEOFF
    ldr x1, [x0]

    // load b64 to x2
    adrp x0, b64@PAGE
    add x0, x0, b64@PAGEOFF
    ldr x2, [x0]

    // sub
    sub x3, x1, x2

    // store result to result64
    adrp x0, result64@PAGE
    add x0, x0, result64@PAGEOFF
    str x3, [x0]

    //exit
    mov x0, #0
    movz x16, #0x1
    movk x16, #0x20, lsl #16
    svc #0