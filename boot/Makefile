AS	= as
LD	= ld
CC	= gcc
OBJCOPY	= objcopy

LDFILE_1 = bootsect.ld
LDFILE_2 = setup.ld

PHONY += all
all: bootsect.bin setup.bin
	dd if=bootsect.bin of=/home/tavis/App/bochs/hd60M.img bs=512 count=1 conv=notrunc
	dd if=setup.bin of=/home/tavis/App/bochs/hd60M.img bs=512 seek=1 count=4 conv=notrunc
	-@rm -f *.bin *.elf *.o

bootsect.bin: bootsect.elf
	$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary $< $@

bootsect.elf: bootsect.o
	$(LD) $< -o $@ -T$(LDFILE_1)

bootsect.o: bootsect.S
	$(CC) -c $< -o $@ 

setup.bin: setup.elf
	$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary $< $@

setup.elf: setup.o
	$(LD) $< -o $@ -T$(LDFILE_2)

setup.o: setup.S
	$(CC) -c $< -o $@ 

PHONY += clean
clean: 
	-@rm -f *.bin *.elf *.o

.PHONY: PHONY
