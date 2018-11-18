


#include <stdio.h>
#include <math.h>
#include <pthread.h>

pthread_attr_t attr;

int volatile count=0;

void *potok(void *param) {
	while (count<0x111) {
		printf("%X\t",param);
		count++;
	}
}

int main(int argc, char *argv[0]) {
	
	pthread_t tid[argc];

	pthread_attr_init(&attr);
	
	for (int i=0; i<argc; i++) {
		printf("%i : %s\n",i,argv[i]);
		pthread_create(&tid[i],&attr,potok,argv[i]);
	}

	float a = sin(1.23);

	for (int j=0; j < argc; j++) pthread_join(tid[j],NULL);

	return 0;
}

