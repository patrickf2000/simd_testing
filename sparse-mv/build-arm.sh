#!/bin/bash
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve spmv_float.c -o spmv1
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve spmv_float.c -o spmv2 -ffp-model=fast
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_spmv_float_sve.c -o spmv_rex

echo "DONE. NOW RUNNING"
echo ""

./spmv1
./spmv2
./spmv_rex

echo "Done"
