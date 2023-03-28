#!/bin/bash

latest=$(
    ls -d v* |
    awk 'BEGIN { FS="."; } { f=substr($1, 2); s=$2; t=$3; print f, s, t, $0;}' |
    sort -k 3n -k 2n -k 1n |
    tail -1 |
    awk '{print $4}'
)
unlink "latest"
ln -s ${latest} "latest"