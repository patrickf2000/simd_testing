#!/bin/bash
clang -fopenmp -O2 -lm -march=native spmv_float.c -o $1/spmv1
clang -fopenmp -O2 -lm -march=knl spmv_float.c -o $1/spmv2
clang -fopenmp -O2 -lm -march=native rose_spmv_float_avx512.c -o $1/spmv_rex

