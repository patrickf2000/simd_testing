#!/bin/bash
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve sum_float.c -o sum1
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve sum_float.c -o sum2 -ffp-model=fast
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_sum_float_sve.c -o sum_rex
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_sum_float_sve2.c -o sum_rex2

echo "DONE. NOW RUNNING"
echo ""

./sum1
./sum2
./sum_rex

echo "Done"
