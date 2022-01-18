#!/bin/bash

# <prog>1 -->    This is compiler-generated (generally AVX512)
# <prog>2 -->    This is forced AVX-512 (knl flag)
# <prog>_rex --> This is Rex generated
#
# Param 1- the program being run
function run_intel() {
    ./$1/$1"1" 1>> intel_explicit.csv
    #echo "," 1>> intel_explicit.csv
    
    ./$1/$1"2" 1>> intel_knl.csv
    #echo "," 1>> intel_knl.csv
    
    ./$1/$1"_rex" 1>> intel_rex.csv
    #echo "," 1>> intel_rex.csv
}

# Run
cd build
rm ./*.csv

echo "Time (s),Correctness" >> intel_explicit.csv
echo "Time (s),Correctness" >> intel_knl.csv
echo "Time (s),Correctness" >> intel_rex.csv

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
