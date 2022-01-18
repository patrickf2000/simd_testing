#!/bin/bash
clang -fopenmp -O2 -lm -march=native matvec_float.c -o $1/matvec1
clang -fopenmp -O2 -lm -march=knl matvec_float.c -o $1/matvec2
clang -fopenmp -O2 -lm -march=native rose_matvec_float_avx512.c -o $1/matvec_rex

