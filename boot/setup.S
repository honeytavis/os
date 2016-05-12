.code16
.text

# 1. Show boot information

	movw  $msg, %si
	movw  $0xb800, %ax
	movw  %ax, %es
	movw  $0, %di

s:	movsb 
	movb  $0x04, %es:(%di)
	 inc  %di
	cmpb  $0, (%si)
	 jne  s

         jmp  . 

msg: .asciz "Operat System is booting..."
