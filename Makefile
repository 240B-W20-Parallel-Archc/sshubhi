CC=gcc
OPTS=-lrt
MULTI=-pthread

all: 
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_8K -o size8K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_8K -o size8K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_8K -o size8K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_8K -o size8K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_8K -o size8K_th16_rd cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_16K -o size16K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_16K -o size16K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_16K -o size16K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_16K -o size16K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_16K -o size16K_th16_rd cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_32K -o size32K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_32K -o size32K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_32K -o size32K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_32K -o size32K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_32K -o size32K_th16_rd cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_64K -o size64K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_64K -o size64K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_64K -o size64K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_64K -o size64K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_64K -o size64K_th16_rd cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_128K -o size128K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_128K -o size128K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_128K -o size128K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_128K -o size128K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_128K -o size128K_th16_rd cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_256K -o size256K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_256K -o size256K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_256K -o size256K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_256K -o size256K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_256K -o size256K_th16_rd cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_512K -o size512K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_512K -o size512K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_512K -o size512K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_512K -o size512K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_512K -o size512K_th16_rd cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_1024K -o size1024K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_1024K -o size1024K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_1024K -o size1024K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_1024K -o size1024K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_1024K -o size1024K_th16_rd cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_2048K -o size2048K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_2048K -o size2048K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_2048K -o size2048K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_2048K -o size2048K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_2048K -o size2048K_th16_rd cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_4096K -o size4096K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_4096K -o size4096K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_4096K -o size4096K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_4096K -o size4096K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_4096K -o size4096K_th16_rd cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_8192K -o size8192K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_8192K -o size8192K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_8192K -o size8192K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_8192K -o size8192K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_8192K -o size8192K_th16_rd cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_1 -D SIZE_16384K -o size16384K_th1_rd cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_2 -D SIZE_16384K -o size16384K_th2_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_4 -D SIZE_16384K -o size16384K_th4_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_8 -D SIZE_16384K -o size16384K_th8_rd cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RD_OP -D THREADS_16 -D SIZE_16384K -o size16384K_th16_rd cache_latency_sumiran.c   	

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_8K -o size8K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_8K -o size8K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_8K -o size8K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_8K -o size8K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_8K -o size8K_th16_rw cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_16K -o size16K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_16K -o size16K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_16K -o size16K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_16K -o size16K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_16K -o size16K_th16_rw cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_32K -o size32K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_32K -o size32K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_32K -o size32K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_32K -o size32K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_32K -o size32K_th16_rw cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_64K -o size64K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_64K -o size64K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_64K -o size64K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_64K -o size64K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_64K -o size64K_th16_rw cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_128K -o size128K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_128K -o size128K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_128K -o size128K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_128K -o size128K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_128K -o size128K_th16_rw cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_256K -o size256K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_256K -o size256K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_256K -o size256K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_256K -o size256K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_256K -o size256K_th16_rw cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_512K -o size512K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_512K -o size512K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_512K -o size512K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_512K -o size512K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_512K -o size512K_th16_rw cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_1024K -o size1024K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_1024K -o size1024K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_1024K -o size1024K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_1024K -o size1024K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_1024K -o size1024K_th16_rw cache_latency_sumiran.c   
	
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_2048K -o size2048K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_2048K -o size2048K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_2048K -o size2048K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_2048K -o size2048K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_2048K -o size2048K_th16_rw cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_4096K -o size4096K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_4096K -o size4096K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_4096K -o size4096K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_4096K -o size4096K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_4096K -o size4096K_th16_rw cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_8192K -o size8192K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_8192K -o size8192K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_8192K -o size8192K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_8192K -o size8192K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_8192K -o size8192K_th16_rw cache_latency_sumiran.c   

	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_1 -D SIZE_16384K -o size16384K_th1_rw cache_latency_sumiran.c  
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_2 -D SIZE_16384K -o size16384K_th2_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_4 -D SIZE_16384K -o size16384K_th4_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_8 -D SIZE_16384K -o size16384K_th8_rw cache_latency_sumiran.c   
	$(CC) $(OPTS) $(MULTI) -D RW_OP -D THREADS_16 -D SIZE_16384K -o size16384K_th16_rw cache_latency_sumiran.c   
clean:
	rm -f size*;
	rm -f rd_overall* rd_thread_cache_latency*;
	rm -f rw_overall* rw_thread_cache_latency*;

	