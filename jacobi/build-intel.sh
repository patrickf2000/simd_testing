#!/bin/bash
clang -fopenmp -O2 -lm -march=native jacobi_float.c -o $1/jacobi1
clang -fopenmp -O2 -lm -march=knl jacobi_float.c -o $1/jacobi2

