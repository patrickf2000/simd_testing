#!/bin/bash
clang -fopenmp -O2 -lm -march=native axpy_float.c -o $1/axpy1
clang -fopenmp -O2 -lm -march=knl axpy_float.c -o $1/axpy2
clang -fopenmp -O2 -lm -march=native rose_axpy_float_avx512.c -o $1/axpy_rex

