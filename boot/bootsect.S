#include <boot.h>

.code16

.global start
start:
.text
	cli
	cld

# 1. Set DS, ES, SS
	xorw  %ax, %ax
        movw  %ax, %ds
        movw  %ax, %es
        movw  %ax, %ss

# 2. Clear screen
        movw  $0x0600, %ax
        movw  $0x0700, %bx
        movw  $0, %cx
        movb  $80, %dl
        movb  $25, %dh
         int  $0x10

# 3. Show "Hello World!" 
	movw  $msg, %si
	movw  $0xb800, %ax
	movw  %ax, %es
	movw  $0, %di

s:	movsb /* ss:si -> es:di */
	movb  $0x04, %es:(%di)
	 inc  %di
	cmpb  $0, (%si)
	 jne  s

# 4. Read setup.S

         jmp  . 

msg: .asciz "Hello World!"

.org 510 
MBR: .word 0xAA55
