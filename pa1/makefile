.PHONY: main

main: build part1 part2

build:
	gcc -o count.o count.c -lpthread
	gcc -o dekker.o dekker.c -lpthread

part1:
	./count.o

part2:
	./dekker.o
