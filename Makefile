CC=arm-none-eabi-gcc
MACH=cortex-m0
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -O0 -Wall
LDFLAGS= -T src/stm32_ls.ld -nostdlib -Wl,-Map=build/final.map

all: build/final.elf

build/main.o: src/main.c
	mkdir build
	$(CC) $(CFLAGS) src/main.c -o build/main.o
	
build/stm32_startup.o: src/stm32_startup.c
	$(CC) $(CFLAGS) src/stm32_startup.c -o build/stm32_startup.o

build/final.elf: build/main.o build/stm32_startup.o
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -rf build/*.o build/*.elf build/final.map
	rm -rd build/

load:
	openocd -f /board/bluepill.cfg

