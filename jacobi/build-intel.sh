#!/bin/bash
clang -fopenmp -O2 -lm -march=native jacobi_float.c -o jacobi1
clang -fopenmp -O2 -lm -march=knl jacobi_float.c -o jacobi2
clang -fopenmp -O2 -lm -march=native rose_jacobi_float_avx512.c -o jacobi_rex

echo "DONE. NOW RUNNING"
echo ""

./jacobi1
./jacobi2
./jacobi_rex

echo "Done"
