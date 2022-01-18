#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No command line argument specified."
    echo "Please enter \"intel\" or \"arm\"."
    exit 1
fi

if [ -d ./build ] ; then
    rm -rf ./build
fi

# If we have intel, go through each folder and call the Intel build scripts
if [[ $1 == "intel" ]] ; then
    for d in ./*/
    do
        CURRENT=`basename $d`
        if [ $CURRENT != "output" ] ; then
            echo $CURRENT
            mkdir -p build/$CURRENT
            touch build/$CURRENT/rex_kmp.h
            (cd "$d" &&
                clang -lm -O0 "$CURRENT"_serial.c -o ../build/$CURRENT/$CURRENT"_serial" &&
                clang -fopenmp -O2 -lm -march=native "$CURRENT"_float.c -o ../build/$CURRENT/$CURRENT"1" &&
                clang -fopenmp -O2 -lm -march=knl "$CURRENT"_float.c -o ../build/$CURRENT/$CURRENT"2" &&
                clang -fopenmp -O2 -lm -march=native rose_"$CURRENT"_float_avx512.c -o ../build/$CURRENT/$CURRENT"_rex"
            )
        fi
    done

# Otherwise, do that for Arm
elif [[ $1 == "arm" ]] ; then
    echo "Building Arm!"
# Otherwise, syntax error!
else
    echo "Error: Invalid architecture."
    echo "Please enter \"intel\" or \"arm\"."
    exit 1
fi

echo "Done!"
