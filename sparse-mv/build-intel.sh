#!/bin/bash
clang -fopenmp -O2 -lm -march=native spmv_float.c -o spmv1
clang -fopenmp -O2 -lm -march=knl spmv_float.c -o spmv2
clang -fopenmp -O2 -lm -march=native rose_spmv_float_avx512.c -o spmv_rex

echo "DONE. NOW RUNNING"
echo ""

./spmv1
./spmv2
./spmv_rex

echo "Done"
