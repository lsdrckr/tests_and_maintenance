CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0 -Wall
LDFLAGS= -T src/stm32_ls.ld -nostdlib -Wl,-Map=final.map

all: src/final.elf

src/%.o: src/%.c
	$(CC) $(CFLAGS) $^ -o $@

src/final.elf: src/main.o src/stm32_startup.o
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -rf src/*.o src/*.elf
