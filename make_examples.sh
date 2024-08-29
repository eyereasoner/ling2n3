#!/bin/bash

for f in examples/acp.trig examples/graph.trig examples/socrates.trig ; do
    ./ling2n3.sh $f
    ./n32ling.sh $f.n3.trig
    $f.sh
done