#define _GNU_SOURCE
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
// Global counter variable
int counter;
int turn = 1;
int wantp = 0;
int wantq = 0;

// function to do
void *P();
void *Q();

int main(int argc, char *argv[])
{

	pthread_attr_t myattr;
    	cpu_set_t cpuset;

    	pthread_attr_init(&myattr);
    	CPU_ZERO(&cpuset);
    	CPU_SET(0, &cpuset);
    	pthread_attr_setaffinity_np(&myattr, sizeof(cpu_set_t), &cpuset);
	
	// Array to hold thread IDs
	pthread_t threads[2];

	// Create threads
	printf("Creating thread 1\n");	
	pthread_create(&threads[0], &myattr, P, NULL);
	printf("Creating thread 2\n");
	pthread_create(&threads[1], &myattr, Q, NULL);	

	// Wait for threads to finish adding to counter
	pthread_join(threads[0],NULL);
	pthread_join(threads[1],NULL);

	// Print final value of counter, should be 4 million
	printf("final value of count = %d\n", counter);	

	// Terminate threads
	pthread_exit(NULL);
}

void *P()
{
	// Non-critical section 
	int i, temp;

	for(i = 0; i < 2000000; i++)
	{
		wantp = 1;
		while(wantq == 1)
		{
			if(turn == 2)
			{
				wantp = 0;
				while(turn != 1){pthread_yield(); }
				wantp = 1;
			}
		}
		// critical section
		temp = counter;
		temp = temp + 1;
		counter = temp; 

		turn = 2;
		wantp = 0;
	}
}

void *Q()
{
 	// Non-critical section
        int i, temp;

        for(i = 0; i < 2000000; i++)
        {
                wantq = 1;
                while(wantp == 1)
                {
                        if(turn == 1)
                        {
                                wantq = 0;
                                while(turn != 2){pthread_yield(); }
                                wantq = 1;
                        }
                }
                // critical section
                temp = counter;
                temp = temp + 1;
                counter = temp;

                turn = 1;
                wantq = 0;
        }
}
