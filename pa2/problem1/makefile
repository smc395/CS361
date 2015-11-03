CC=spin
Forbidden='<>(critical>1)'

spin: ticket.pml
	$(CC) -f $(Forbidden) -a ticket.pml

compile: pan.c
	gcc -o pan pan.c

run:
	./pan -a

clean:
	rm pan*
