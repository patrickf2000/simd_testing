#!/bin/bash
clang -fopenmp -O2 -lm -march=native matmul_float.c -o matmul1
clang -fopenmp -O2 -lm -march=knl matmul_float.c -o matmul2
clang -fopenmp -O2 -lm -march=native rose_matmul_float_avx512.c -o matmul_rex

echo "DONE. NOW RUNNING"
echo ""

./matmul1
./matmul2
./matmul_rex

echo "Done"
