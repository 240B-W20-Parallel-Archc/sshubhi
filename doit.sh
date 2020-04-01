#!/bin/sh

for i in rd rw
do
	for j in 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
	do
		for k in 1 2 4 8 16
		do
			./size${j}K_th${k}_${i}
		done
	done
done

