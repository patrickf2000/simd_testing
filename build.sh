#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No command line argument specified."
    echo "Please enter \"intel\" or \"arm\"."
    exit 1
fi

# If we have intel, go through each folder and call the Intel build scripts
if [[ $1 == "intel" ]] ; then
    for d in ./*/
    do
        CURRENT=`basename $d`
        echo $CURRENT
        mkdir -p build/$CURRENT
        (cd "$d" && ./build-intel.sh "../build/$CURRENT")
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
