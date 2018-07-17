all : gugudan

gugudan : gugudan.o
	ld gugudan.o -o gugudan -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2

gugudan.o : gugudan.asm
	nasm -felf64 -o gugudan.o gugudan.asm

clean :
	rm -rf gugudan.o gugudan

