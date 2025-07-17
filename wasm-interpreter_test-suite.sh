#!/usr/bin/bash

for testF in test-suite/randomized/*.wat
do
    echo "Test: $testF"
    wasm $testF -e '(invoke "$func0")'
done