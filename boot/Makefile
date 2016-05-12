AS	= as
LD	= ld
OBJCOPY	= objcopy

LDFILE	= bootsect.ld

PHONY += all
all: bootsect.bin setup.bin
	@dd if=$< of=/home/tavis/App/bochs/hd60M.img bs=512 count=1 conv=notrunc
	@dd if=$< of=/home/tavis/App/bochs/hd60M.img bs=512 count=1 conv=notrunc

	@rm -f *.o *.elf

bootsect.bin: bootsect.elf
	$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary $< $@

bootsect.elf: bootsect.o
	$(LD) $< -o $@ -T$(LDFILE)

bootsect.o: bootsect.S
	$(AS) $< -o $@ 

setup.bin: setup.elf
	$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary $< $@

setup.elf: setup.o
	$(LD) $< -o $@ -T$(LDFILE)

setup.o: setup.S
	$(AS) $< -o $@ 

PHONY += clean
clean: 
	-rm -f bootsect.bin bootsect.elf bootsect.o

.PHONY: PHONY
