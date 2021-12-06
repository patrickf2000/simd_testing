#!/bin/bash
clang -fopenmp -O2 -lm -march=native matvec_float.c -o matvec1
clang -fopenmp -O2 -lm -march=knl matvec_float.c -o matvec2
clang -fopenmp -O2 -lm -march=native rose_matvec_float_avx512.c -o matvec_rex

echo "DONE. NOW RUNNING"
echo ""

./matvec1
./matvec2
./matvec_rex

echo "Done"
