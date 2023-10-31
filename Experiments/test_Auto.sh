#!/bin/bash
for i in .0 
do
    echo "Running for $i"
    python3 NoOverlap.py -f ./Results/arbiter_test/EqualEta/ -v 6 -o $i -nt  100
done