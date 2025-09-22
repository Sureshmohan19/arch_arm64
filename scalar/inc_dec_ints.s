.global _start
.align 2

.section __DATA, __data
    // 32-bit 
    .align 2
    a32:    .word 25
    b32:    .word 50
    resultADD32:   .word 0
    resultSUB32:    .word 0

    //64-bit
    .align 3
    a64:    .quad 250000
    b64:    .quad 500000
    resultADD64:   .quad 0
    resultSUB64:    .quad 0

.section __TEXT, __text
_start:
    //load a32 and increment by 1
    adrp x0, a32@PAGE
    add x0, x0, a32@PAGEOFF
    ldr w1, [x0]
    add w1, w1, #1
    adrp x0, resultADD32@PAGE
    add x0, x0, resultADD32@PAGEOFF
    str w1, [x0]

    //load b32 and decrement by 1
    adrp x0, b32@PAGE
    add x0, x0, b32@PAGEOFF
    ldr w1, [x0]
    sub w1, w1, #1
    adrp x0, resultSUB32@PAGE
    add x0, x0, resultSUB32@PAGEOFF
    str w1, [x0]

    //load a64 and increment by 1000
    adrp x0, a64@PAGE
    add x0, x0, a64@PAGEOFF
    ldr x1, [x0]
    add x1, x1, #1000
    adrp x0, resultADD64@PAGE
    add x0, x0, resultADD64@PAGEOFF
    str x1, [x0]

    //load b64 and decrement by 230
    adrp x0, b64@PAGE
    add x0, x0, b64@PAGEOFF
    ldr x1, [x0]
    sub x1, x1, #230
    adrp x0, resultSUB64@PAGE
    add x0, x0, resultSUB64@PAGEOFF
    str x1, [x0]

    //exit
    mov x0, #0
    movz x16, #0x1
    movk x16, #0x20, lsl #16
    svc #0