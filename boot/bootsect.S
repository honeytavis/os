#include "bootsect.h"

.code16
.text

.global start
start:
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

# 3. Print "Hello World!" 
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
	call  disk_read

# 5. jmp setup.S
       	 jmp  $SETUP_BASE_ADDR, $0

disk_read:
	# 1. set sector count 
	movb  $SETUP_SECT_NUM, %al
	movw  $DISK_SECTOR_COUNT, %dx
	outb  %al, %dx

	# 2. set LBA address
	movl  $SETUP_START_SECT, %eax
	movw  $DISK_LBA_LOW, %dx
	outb  %al, %dx

	movb  $8, %cl
	 shr  %cl, %eax
	movw  $DISK_LBA_MID, %dx
	outb  %al, %dx

	 shr  %cl, %eax
	movw  $DISK_LBA_HIGH, %dx
	outb  %al, %dx
	
	 shr  %cl, %eax
	 and  $0x0f, %al
	  or  $0xe0, %al
	movw  $DISK_DEVICE, %dx
	outb  %al, %dx

	# 3. set status
	movw  $DISK_COMMAND, %dx
	movb  $0x20, %al
	outb  %al, %dx

	# 4. confirm disk ready 
	movw  $DISK_STATUS, %dx
wait:
	 inb  %dx, %al
	 and  $0x88, %al
	 cmp  $0x08, %al
	 jnz  wait

	# 5. disk --> RAM 
	movw  $SETUP_SECT_NUM, %ax
	movw  $256, %dx
	mulw  %dx
	movw  %ax, %cx
	movw  $SETUP_ADDR, %bx
	movw  $DISK_IOADDR1, %dx
read:
	 inw  %dx, %ax
	movw  %ax, (%bx)
	addl  $2, %ebx
	loop  read
	 ret

msg: .asciz "Hello World!"

.org 510 
MBR: .word 0xAA55
