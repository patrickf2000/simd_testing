#!/bin/bash
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve jacobi_float.c -o jacobi1
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve jacobi_float.c -o jacobi2 -ffp-model=fast
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_jacobi_float_sve.c -o jacobi_rex

echo "DONE. NOW RUNNING"
echo ""

./jacobi1
./jacobi2
./jacobi_rex

echo "Done"
