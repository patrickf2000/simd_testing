#!/bin/bash
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve matvec_float.c -o matvec1
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve matvec_float.c -o matvec2 -ffp-model=fast
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_matvec_float_sve.c -o matvec_rex
armclang -mcpu=a64fx -armpl -fopenmp -O2 -lm -march=armv8-a+sve rose_matvec_float_sve2.c -o matvec_rex2

echo "DONE. NOW RUNNING"
echo ""

./matvec1
./matvec2
./matvec_rex

echo "Done"
