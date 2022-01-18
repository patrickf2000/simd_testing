#!/bin/bash

# <prog>1 -->    This is compiler-generated (generally AVX512)
# <prog>2 -->    This is forced AVX-512 (knl flag)
# <prog>_rex --> This is Rex generated
#
# Param 1- the program being run
function run_intel() {
    CSV=$1".csv"
    echo "OpenMP (AVX-2),,OpenMP (AVX-512),,Rex," 1>> $CSV
    
    for i in {1..10}
    do
        ./$1/$1"1" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"2" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"_rex" | tr -d '\n' 1>> $CSV
        echo "" 1>> $CSV
    done
    echo "=AVERAGE(A2:A11),,=AVERAGE(C2:C11),,=AVERAGE(E2:E11)" 1>> $CSV
}

# Run
cd build
rm ./*.csv

for d in ./*/
do
    CURRENT=`basename $d`
    if [ $CURRENT != "output" ] ; then
        echo $CURRENT
        run_intel $CURRENT
    fi
done

cd ..

mkdir output
rm output/*
cp build/*.csv ./output

echo "Done"
