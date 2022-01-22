#!/bin/bash

# <prog>_serial -> This is the serial, unoptimized version
# <prog>1 -->    This is compiler-generated (generally AVX512)
# <prog>2 -->    This is forced AVX-512 (knl flag)
# <prog>_rex --> This is Rex generated
#
# Param 1- the program being run
# Param 2- the number of times to run each program
function run_intel() {
    CSV=$1".csv"
    LAST=$(($2 + 1))
    echo "Serial,,OpenMP (AVX-2),,OpenMP (AVX-512),,Rex," 1>> $CSV
    
    for i in 1 .. $2
    do
        ./$1/$1"_serial" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"1" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"2" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"_rex" | tr -d '\n' 1>> $CSV
        echo "" 1>> $CSV
    done
    echo "=AVERAGE(A2:A$LAST),,=AVERAGE(C2:C$LAST),,=AVERAGE(E2:E$LAST),,=AVERAGE(G2:G$LAST)," 1>> $CSV
}

# Arm function; this is the same as the Intel
function run_arm() {
    CSV=$1"_arm.csv"
    LAST=$(($2 + 1))
    echo "Serial,,OpenMP (SVE2),,OpenMP (SVE2 with faddv),,Rex," 1>> $CSV

    for i in $(seq 1 $2)
    do
        ./$1/$1"_serial" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"1" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"2" | tr -d '\n' 1>> $CSV
        printf "," 1>> $CSV
        
        ./$1/$1"_rex" | tr -d '\n' 1>> $CSV
        echo "" 1>> $CSV
    done
    echo "=AVERAGE(A2:A$LAST),,=AVERAGE(C2:C$LAST),,=AVERAGE(E2:E$LAST),,=AVERAGE(G2:G$LAST)," 1>> $CSV
}

# Make sure we have a command line argument
if [ -z "$1" ]; then
    echo "Error: No command line argument specified."
    echo "Please enter \"intel\" or \"arm\"."
    exit 1
fi

RUNS=10
if [ ! -z "$2" ] ; then
    RUNS=$2
fi

# Run
cd build
rm ./*.csv

for d in ./*/
do
    CURRENT=`basename $d`
    if [ $CURRENT != "output" ] ; then
        echo $CURRENT
        if [[ $1 == "intel" ]] ; then
            run_intel $CURRENT $RUNS
        elif [[ $1 == "arm" ]] ; then
            run_arm $CURRENT $RUNS
        fi
    fi
done

cd ..

if [[ ! -d ./output ]]; then
    mkdir output
fi

cp build/*.csv ./output

echo "Done"

