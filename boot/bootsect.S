#include <boot.h>

.code16

.global start
start:
.text
         cli
	 cld

# 1. Set DS, ES, SS
	xorw	%ax, %ax
        movw    %ax, %ds
        movw    %ax, %es
        movw    %ax, %ss

# 2. Clear screen
        movw    $0x0600, %ax
        movw    $0x0700, %bx
        movw    $0, %cx
        movb    $80, %dl
        movb    $25, %dh
         int    $0x10

# 3. Show "hello world"
        movw    $msg, %ax
        movw    %ax, %bp
        movw    $0x00c, %bx
        movw    $12, %cx
	movw	$0, %dx
        movw    $0x1301, %ax
         int    $0x10

         jmp    . 

msg: .ascii "hello world!"

.org 510 
MBR: .word 0xAA55
