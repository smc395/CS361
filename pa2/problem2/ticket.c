#include <pthread.h>
#include <stdio.h>
#define X 1
#define NUM 2000000
//global variables
int ticket=1, serving=1, counter;
pthread_mutex_t mutex; // create mutex variable

void *Count();

int main(int argc, char *argv[]){
	// Array to hold thread IDs
        pthread_t threads[2];

        // Create threads
        printf("Creating thread 1\n");
        pthread_create(&threads[0], NULL, Count, NULL);
        printf("Creating thread 2\n");
        pthread_create(&threads[1], NULL, Count, NULL);

	// Init mutex lock
	pthread_mutex_init(&mutex, NULL);

        // Wait for threads to finish adding to counter
        pthread_join(threads[0],NULL);
        pthread_join(threads[1],NULL);

        // Print final value of counter, should be 4 million
        printf("final value of count = %d\n", counter);

        // Terminate threads
        pthread_mutex_destroy(&mutex);
	pthread_exit(NULL);
}

// fetch-and-increment
int fetch_and_increment(){
	int temp;
	pthread_mutex_lock(&mutex);
	temp = ticket;
	ticket = ticket + 1;
	pthread_mutex_unlock(&mutex);
	return temp;
}

// acquire
void acquire(int myticket){
	while(myticket != serving){pthread_yield();}
}
// release
void release(int myticket){
	serving = myticket + 1;
}
// count function
void *Count(){
        int i, temp, myticket;

        for(i = 0; i < 2000000; i++){
		// acquire lock
		myticket = fetch_and_increment();
		acquire(myticket);
                temp = counter;
                temp = temp + 1;
                counter = temp;
		release(myticket);
		// release lock
        }
}

