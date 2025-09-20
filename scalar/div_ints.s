.global _start
.align  2

.section __DATA, __data
    a32:    .word 5
    b32:    .word 10
    a32S:   .word -100
    b32S:   .word 4
    a64:    .quad 25000
    b64:    .quad 1001
    a64S:   .quad -234567
    b64S:   .quad 45678
    result32:   .word 0
    result32S:  .word 0
    result64:   .quad 0
    result64S:  .quad 0

.section __TEXT, __text
_start:
    // udiv - load a32 and b32S and udiv and store
    adrp x0, a32@PAGE
    add x0, x0, a32@PAGEOFF
    ldr w1, [x0]
    adrp x0, b32@PAGE
    add x0, x0, b32@PAGEOFF
    ldr w2, [x0]

    udiv w3, w1, w2
    adrp x0, result32@PAGE
    add x0, x0, result32@PAGEOFF
    str w3, [x0]

    // sdiv - load a32S and b32 and sdiv and store
    adrp x0, a32S@PAGE
    add x0, x0, a32S@PAGEOFF
    ldr w1, [x0]
    adrp x0, b32S@PAGE
    add x0, x0, b32S@PAGEOFF
    ldr w2, [x0]

    sdiv w3, w1, w2
    adrp x0, result32S@PAGE
    add x0, x0, result32S@PAGEOFF
    str w3, [x0]

    // udiv - load a64 and b64 and udiv and store
    adrp x0, a64@PAGE
    add x0, x0, a64@PAGEOFF
    ldr x1, [x0]
    adrp x0, b64@PAGE
    add x0, x0, b64@PAGEOFF
    ldr x2, [x0]

    udiv x3, x1, x2
    adrp x0, result64@PAGE
    add x0, x0, result64@PAGEOFF
    str x3, [x0]

    // sdiv - load a64S and b64S and sdiv and store
    adrp x0, a64S@PAGE
    add x0, x0, a64S@PAGEOFF
    ldr x1, [x0]
    adrp x0, b64S@PAGE
    add x0, x0, b64S@PAGEOFF
    ldr x2, [x0]

    sdiv x3, x1, x2
    adrp x0, result64S@PAGE
    add x0, x0, result64S@PAGEOFF
    str x3, [x0]

    // exit
    mov x0, #0
    movz x16, #0x1
    movk x16, #0x20, lsl #16
    svc #0
