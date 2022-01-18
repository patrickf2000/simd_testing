#!/bin/bash
clang -fopenmp -O2 -lm -march=native sum_float.c -o $1/sum1
clang -fopenmp -O2 -lm -march=knl sum_float.c -o $1/sum2
clang -fopenmp -O2 -lm -march=native rose_sum_float_avx512.c -o $1/sum_rex

