.global _start
.align 2

.section __DATA, __data
    a32:    .word 0x12345678
    a64:    .quad 0x1122334455667788
    result32:   .word 0
    result64:   .quad 0

.section __TEXT, __text
_start:
    // load a32
    adrp x0, a32@PAGE
    add x0, x0, a32@PAGEOFF
    ldr w1, [x0]

    // load result32 and copy w1
    adrp x0, result32@PAGE
    add x0, x0, result32@PAGEOFF
    str w1, [x0]

    // load a64
    adrp x0, a64@PAGE
    add x0, x0, a64@PAGEOFF
    ldr x1, [x0]

    // load result64 and copy x1
    adrp x0, result64@PAGE
    add x0, x0, result64@PAGEOFF
    str x1, [x0]

    // exit
    mov x0, #0
    movz x16, #0x1
    movk x16, #0x20, lsl #16
    svc #0