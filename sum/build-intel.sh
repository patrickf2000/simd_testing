#!/bin/bash
clang -fopenmp -O2 -lm -march=native sum_float.c -o sum1
clang -fopenmp -O2 -lm -march=knl sum_float.c -o sum2
clang -fopenmp -O2 -lm -march=native rose_sum_float_avx512.c -o sum_rex

echo "DONE. NOW RUNNING"
echo ""

./sum1
./sum2
./sum_rex

echo "Done"
