#!/bin/bash
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve axpy_float.c -o axpy1
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve axpy_float.c -o axpy2 -ffp-model=fast
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_axpy_float_sve.c -o axpy_rex

echo "DONE. NOW RUNNING"
echo ""

./axpy1
./axpy2
./axpy_rex

echo "Done"
