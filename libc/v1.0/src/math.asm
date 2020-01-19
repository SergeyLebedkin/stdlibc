    .text
    .intel_syntax noprefix

    .global sin_asm
sinf:
    # store rbp
    push    rbp
    mov     rbp, rsp
    # store registers
    movaps  [rbp-16], xmm1
    movaps  [rbp-32], xmm2

    # xmm2 = x^2, x^2, x^2, x^2
    movaps  xmm2, xmm0 # x
    mulss   xmm2, xmm2 # x^2

    # xmm0 = x^1, x^3, x^5, x^7
    shufps  xmm0, xmm0, 0b00100100
    mulss   xmm0, xmm2 # xmm0 = x^3
    shufps  xmm0, xmm0, 0b11000100
    mulss   xmm0, xmm2 # xmm0 = x^5
    shufps  xmm0, xmm0, 0b11100000
    mulss   xmm0, xmm2 # xmm0 = x^7

    # xmm1 = x^9, x^11, x^13, x^15
    movaps  xmm1, xmm0
    shufps  xmm1, xmm1, 0b11111111
    mulss   xmm1, xmm0 # x^8
    shufps  xmm1, xmm1, 0b00000000
    mulps   xmm1, xmm0 # x^15

    # multyply by coeficients
    mulps   xmm0, [M_SIN_07_05_03_01]
    mulps   xmm1, [M_SIN_15_13_11_09]
    addps   xmm0, xmm1
    
    # acumulate result
    haddps  xmm0, xmm0 # SSE3
    haddps  xmm0, xmm0 # SSE3

    # restore registers
    movaps  xmm2, [rbp-32]
    movaps  xmm1, [rbp-16]
    # restore rbp
    pop     rbp
    ret

    .data
# MUST be alligned by 16 bytes for using in SSE
M_SIN_15_13_11_09:
    .float -7.6471637318198164759011319e-13 # 1/fact(15)
    .float +1.6059043836821614599392377e-10 # 1/fact(13)
    .float -2.5052108385441718775052108e-08 # 1/fact(11)
    .float +2.7557319223985890652557319e-06 # 1/fact(09)
# MUST be alligned by 16 bytes for using in SSE
M_SIN_07_05_03_01:
    .float -1.9841269841269841269841269e-04 # 1/fact(07)
    .float +8.3333333333333333333333333e-03 # 1/fact(05)
    .float -1.6666666666666666666666667e-01 # 1/fact(03)
    .float +1.0000000000000000000000000e-00 # 1/fact(01)
