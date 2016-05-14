.code16
.text

# 1. Show boot information

	movw  $msg2, %si
	movw  $0xb800, %ax
	movw  %ax, %es
	movw  $0, %di

s2:	movsb 
	movb  $0x04, %es:(%di)
	 inc  %di
	cmpb  $0, (%si)
	 jne  s2

         jmp  . 

msg2: .asciz "Operat System is loading..."
