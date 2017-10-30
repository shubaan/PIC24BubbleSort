.bss
list: .space 24

.text
.global __reset
__reset:

;initialize list
mov #0x0008, w0
mov #0x8000, w1
mov #0x1000, w2
mov.d w0, [w2]

mov #0x0005, w0
mov #0x5000, w1
mov #0x1004, w2
mov.d w0, [w2]

mov #0x0001, w0
mov #0x1000, w1
mov #0x1008, w2
mov.d w0, [w2]

mov #0x0004, w0
mov #0x4000, w1
mov #0x100C, w2
mov.d w0, [w2]

mov #0x000A, w0
mov #0xA000, w1
mov #0x1010, w2
mov.d w0, [w2]

mov #0x000C, w0
mov #0xC000, w1
mov #0x1014, w2
mov.d w0, [w2]

mov #0x0009, w0
mov #0x9000, w1
mov #0x1018, w2
mov.d w0, [w2]

mov #0x0000, w0
mov #0x0000, w1
mov #0x101C, w2
mov.d w0, [w2]

mov #0x000E, w0
mov #0xE000, w1
mov #0x1020, w2
mov.d w0, [w2]

mov #0x000E, w0
mov #0x3000, w1
mov #0x1024, w2
mov.d w0, [w2]

mov #0x0008, w0
mov #0x8000, w1
mov #0x1028, w2
mov.d w0, [w2]

mov #0x0002, w0
mov #0x2000, w1
mov #0x102C, w2
mov.d w0, [w2]

;w2 = lsw n
;w3 = msw n
;w4 = lsw n+1
;w5 = msw n+1
;w11 = loop counter

begin:
mov #11, w11
mov #list, w2
mov #list+2, w3
mov #list+4, w4
mov #list+6, w5
    
loop:
cp0 w11
bra Z, done
    
;read n, n+1
mov.d [w2], w6 
mov.d [w4], w8

;compare
cp w6, w8
cpb w7, w9 
bra LEU, next    
;swap
mov.d w8, [w2]
mov.d w6, [w4]
bra begin


next:
;n=n+1
mov w4, w2
mov w5, w3
;n+1=n+2
mov #4, w0
add w0, w4, w4
add w0, w5, w5
dec w11, w11
bra loop
    
done:
    goto     done   
