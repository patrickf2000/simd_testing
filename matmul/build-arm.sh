#!/bin/bash
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve matmul_float.c -o matmul1
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve matmul_float.c -o matmul2 -ffp-model=fast
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_matmul_float_sve.c -o matmul_rex

echo "DONE. NOW RUNNING"
echo ""

./matmul1
./matmul2
./matmul_rex

echo "Done"
