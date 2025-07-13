#!/usr/bin/bash

for testF in test-suite/*
do
    echo "Test: $testF"
    wasm $testF -e '(invoke "$func0")'
done