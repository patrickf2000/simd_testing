#!/bin/bash
clang -fopenmp -O2 -lm -march=native axpy_float.c -o axpy1
clang -fopenmp -O2 -lm -march=knl axpy_float.c -o axpy2
clang -fopenmp -O2 -lm -march=native rose_axpy_float_avx512.c -o axpy_rex

echo "DONE. NOW RUNNING"
echo ""

./axpy1
./axpy2
./axpy_rex

echo "Done"
