// global variables
int ticket = 1;
int serving = 1;
int critical = 0;
#define X 1

active [2] proctype ticketlock()
{
	//loop forever
	do::
		int myticket;
		atomic //fetch-and-increment
		{ 
			myticket = ticket;
			ticket = ticket + X;
		}
		(myticket == serving); //await myticket == serving
		critical = critical + 1;
		// In critical section
		assert(critical <= 1);
		critical = critical - 1;
		serving = myticket + 1;	
	od
}
