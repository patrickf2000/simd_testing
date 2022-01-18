#!/bin/bash
clang -fopenmp -O2 -lm -march=native matmul_float.c -o $1/matmul1
clang -fopenmp -O2 -lm -march=knl matmul_float.c -o $1/matmul2
clang -fopenmp -O2 -lm -march=native rose_matmul_float_avx512.c -o $1/matmul_rex

