CC=spin
Forbidden='<>(critical>1)'

spin: mcs.pml
	$(CC) -f $(Forbidden) -a mcs.pml

compile: pan.c
	gcc -o pan pan.c

run:
	./pan -a

clean:
	rm pan*
