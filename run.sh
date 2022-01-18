#!/bin/bash

# <prog>1 -->    This is compiler-generated (generally AVX512)
# <prog>2 -->    This is forced AVX-512 (knl flag)
# <prog>_rex --> This is Rex generated
#
# Param 1- the program being run
function run_intel() {
    #printf "$1," 1>> intel_explicit.csv
    #./$1/$1"1" 1>> intel_explicit.csv
    
    #printf "$1," 1>> intel_knl.csv
    #./$1/$1"2" 1>> intel_knl.csv
    
    #printf "$1," 1>> intel_rex.csv
    #./$1/$1"_rex" 1>> intel_rex.csv
    
    CSV=$1".csv"
    echo "OpenMP (AVX-2),,OpenMP (AVX-512),,Rex," 1>> $CSV
    ./$1/$1"1" | tr -d '\n' 1>> $CSV
    printf "," 1>> $CSV
    
    ./$1/$1"2" | tr -d '\n' 1>> $CSV
    printf "," 1>> $CSV
    
    ./$1/$1"_rex" | tr -d '\n' 1>> $CSV
    echo "" 1>> $CSV
}

# Run
cd build
rm ./*.csv

#echo "Program,Time (s),Correctness" >> intel_explicit.csv
#echo "Program,Time (s),Correctness" >> intel_knl.csv
#echo "Program,Time (s),Correctness" >> intel_rex.csv

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
