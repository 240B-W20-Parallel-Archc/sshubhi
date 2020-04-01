#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

#define BASE_SIZE 8000   
#ifdef SIZE_8K
    #define SIZE_FACTOR 1
#endif
#ifdef SIZE_16K
    #define SIZE_FACTOR 2
#endif
#ifdef SIZE_32K
    #define SIZE_FACTOR 4
#endif
#ifdef SIZE_64K
    #define SIZE_FACTOR 8
#endif
#ifdef SIZE_128K
    #define SIZE_FACTOR 16
#endif
#ifdef SIZE_256K
    #define SIZE_FACTOR 32
#endif
#ifdef SIZE_512K
    #define SIZE_FACTOR 64
#endif
#ifdef SIZE_1024K
    #define SIZE_FACTOR 128
#endif
#ifdef SIZE_2048K
    #define SIZE_FACTOR 256
#endif
#ifdef SIZE_4096K
    #define SIZE_FACTOR 512
#endif
#ifdef SIZE_8192K
    #define SIZE_FACTOR 1024
#endif
#ifdef SIZE_16384K
    #define SIZE_FACTOR 2048
#endif


const int SECONDS_PER_NS = 1000000000;
#ifdef THREADS_1
    #define NUM_THREAD 1
#endif
#ifdef THREADS_2
    #define NUM_THREAD 2
#endif
#ifdef THREADS_4
    #define NUM_THREAD 4
#endif
#ifdef THREADS_8
    #define NUM_THREAD 8
#endif
#ifdef THREADS_16
    #define NUM_THREAD 16
#endif




/* create thread argument struct for thr_func() */
typedef struct _thread_data_struct {
  int thread_id;
  double avg_latency;
  struct Node *arr;
} thread_data_t;

/* struct for linked list. Size of each node is 64 Bytes */
struct Node  
{ 
  uint32_t value[14];
  struct Node *next; 
};

FILE *fp;
FILE *fp2;

// This function does accesses (read, read-write) to the contents of linked list starting from  
// the given node 
double do_accesses(struct Node *n, int thread_id) 
{ 
  srand(time(NULL));  // Seed ONCE
  double TotalAccessTime = 0.0, AvgAccessTime = 0.0, AccessTime = 0.0;
  struct timespec startAccess, endAccess;
  int var, idx = 0;
  while (n != NULL)
	{ 
    idx++;    
    int  value_idx = rand() % 14;
    asm (
      "mfence\n\t"        // memory fence
      :
      :
    );
    clock_gettime(CLOCK_REALTIME, &startAccess); //start clock
#ifdef RD_OP
    //var = n->value[value_idx];
    
    asm (
      "mov %0, %%al\n\t"  // load data
      :
      : "m" (n->value[value_idx])
    );
    
#endif
#ifdef RW_OP
    asm (
      "mov (%0), %%al\n\t"  // load data
      "add %%al, %%al\n\t"  // add 2
      "mov %%al, (%0)\n\t"  // store data
      :
      : "r" (&n->value[value_idx])
      , "m" (n->value[value_idx])
    );
#endif

    clock_gettime(CLOCK_REALTIME, &endAccess); //end clock
    asm (
      "mfence\n\t"        // memory fence
      :
      :
    );
    AccessTime = ((endAccess.tv_sec - startAccess.tv_sec) * SECONDS_PER_NS) + (endAccess.tv_nsec - startAccess.tv_nsec);  
    //printf("Single access time is %0.2fns, index is %d, address accessed is %p\n", AccessTime, idx, n); 
    TotalAccessTime+= AccessTime; 
    n = n->next; 
  } 
  
    AvgAccessTime = TotalAccessTime/(BASE_SIZE*SIZE_FACTOR/sizeof(struct Node));
    return AvgAccessTime;
}

/* this function creates a linked list either in sequential or non-sequential manner
as dictated by the defines and returns a pointer to the head of the LL*/
/*
struct Node * create_ll (int array_size){
  struct Node *array;
  int rev_size = array_size/sizeof(struct Node);

  array = (struct Node*)malloc(rev_size*sizeof(struct Node));
  if( array == NULL ){
      //printf("malloc failed!\n");
      exit(1);
  }else{
    //printf("malloc passes\n");
  }
  size_t i;
  for (i=0; i<rev_size; i++){
    if (i != rev_size - 1) {
        array[i].next = &array[i+1];
        //printf("create_ll: index is %lu\n, current address is %p, next address is %p\n",i, &array[i], array[i].next);
    }
    else {
        array[i].next = NULL;
        //printf("create_ll NULL!!: index is %lu\n, current address is %p, next address is %p\n",i, &array[i], array[i].next);
    }
    for (int j=0; j<14; j++) {
        array[i].value[j] = ((rand() % 1024) << 10) + j;
    }
  }
   return array;
} */

struct Node * create_ll (int array_size){

  struct Node *array;
  int rev_size = array_size/sizeof(struct Node);
  array = (struct Node*)malloc(sizeof(struct Node)*rev_size);
  if( array == NULL ){
      printf("malloc failed!\n");
      exit(1);
  }else{
    //printf("malloc done \n" );
  }
  size_t i;
  for (i=0; i<rev_size;i++){
    array[i].next = NULL;
  }

  //setup linked list
  int64_t random_offset = 1;
  int64_t previous_offset = 0;
  int rand_nums_occurred[rev_size];
  for (i = 0; i < rev_size; i++){
    rand_nums_occurred[i] = 0;
  }
  rand_nums_occurred[0] = 1;
    
  for (i = 0; i < rev_size - 1; i++){
#ifndef SEQ_ACCESS
    int repeat = 1;
    int count = 0;
    while (repeat == 1 && count < 300){
      random_offset += rand();
        random_offset %= rev_size;
        if (rand_nums_occurred[random_offset] == 1){
          repeat = 1;
          count++;
          //printf("count%d\n",count );
        }else{
          rand_nums_occurred[random_offset] = 1;
          repeat = 0;
        }
    }
    if (count >= 300){
      break;
    }
#endif
#ifdef SEQ_ACCESS
    random_offset = i+1;
#endif
    array[previous_offset].next = &array[random_offset];
    int j = 0;
    for (j=0; j<14; j++){
        array[previous_offset].value[j] = ((rand() % 1024) << 10) + j;
    }
    previous_offset = random_offset;
  }
    return array;
}


void *thr_main(void *arg) {
  thread_data_t *thr_data = (thread_data_t *)arg;
  struct Node *array = thr_data->arr;
  int rep;
  double ThTotalAccessTime = 0.0, ThAvgAccessTime = 0.0, ThAccessTime = 0.0;

  //ThAccessTime = do_accesses(&array[0], thr_data->thread_id);
  for (rep = 0; rep<5; rep++) {
    ThAccessTime = do_accesses(&array[0], thr_data->thread_id);
    ThTotalAccessTime+= ThAccessTime;
  }
  ThAvgAccessTime = ThTotalAccessTime/5;
  thr_data->avg_latency = ThAvgAccessTime;
  fprintf(fp2, "%dB, %d, %d, %0.2fns\n", SIZE_FACTOR*BASE_SIZE, NUM_THREAD, thr_data->thread_id, ThAvgAccessTime);
  pthread_exit(NULL);
}


/* main function to setup the linked list and start multi-threaded execution */
int main(int argc, char **argv) {
    struct Node *array;
    pthread_t thread[NUM_THREAD];
    int err, arr_size;
    double total_latency = 0.0, latency = 0.0, avg_latency = 0.0;

   
  /* create a thread_data_t argument array */
  thread_data_t thr_data[NUM_THREAD];
  arr_size = BASE_SIZE*SIZE_FACTOR;
  #ifdef RD_OP
    fp = fopen("rd_overall_cache_latency_report.csv", "a");
    fp2 = fopen("rd_thread_cache_latency_report.csv", "a");
   #endif
   #ifdef RW_OP
    fp = fopen("rw_overall_cache_latency_report.csv", "a");
    fp2 = fopen("rw_thread_cache_latency_report.csv", "a");
   #endif

  //printf("Main function: product is %d\n",arr_size);
  array = create_ll(BASE_SIZE*SIZE_FACTOR);
 
  for (int tid =0; tid< NUM_THREAD; tid++) {
    thr_data[tid].thread_id = tid;
    thr_data[tid].arr = &array[0];
    if (err = pthread_create(&thread[tid], NULL, thr_main, &thr_data[tid])) {
      fprintf(stderr, "error: thread_id:%d# pthread_create, err: %d\n", tid, err);
      return EXIT_FAILURE;
    }
  }

  for (int tid = 0; tid < NUM_THREAD; tid++) {
    pthread_join(thread[tid], NULL);
  }
  for (int tid = 0; tid < NUM_THREAD; tid++) {
      total_latency += thr_data[tid].avg_latency;
  }
  avg_latency = total_latency/NUM_THREAD;
  fprintf(fp, "%dB, %d, %0.2fns\n", SIZE_FACTOR*BASE_SIZE, NUM_THREAD, avg_latency);

  fprintf(fp, "\n\n\n");
  fprintf(fp2, "\n\n\n");

  fclose(fp);
  fclose(fp2);
  free(array);
  return EXIT_SUCCESS;


  /*double TotalAccessTime = 0.0, AvgAccessTime = 0.0, AccessTime = 0.0;
  struct timespec startAccess, endAccess;
  //volatile struct Node td_item;
  //td_item.next = NULL;
  //td_item.value[0] = 9;
  volatile int arr[5];
  int random;
  for (int num=0; num<10; num++){
    clock_gettime(CLOCK_REALTIME, &startAccess); 
    random = arr[num/2]; 
    clock_gettime(CLOCK_REALTIME, &endAccess);
    AccessTime = ((endAccess.tv_sec - startAccess.tv_sec) * SECONDS_PER_NS) + (endAccess.tv_nsec - startAccess.tv_nsec);  
    printf("Single access time is %0.2fns, num is %d \n", AccessTime, num); 
    TotalAccessTime+= AccessTime; 
  }
  AvgAccessTime = TotalAccessTime/10;  
  printf("AvgAccessTime is %0.2fns\n",AvgAccessTime);
  printf("Main_thread: hello, successfully completed\n");
 */
}