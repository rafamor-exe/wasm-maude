#!/usr/bin/bash

MAUDE_LIBRARY="/bin"
PROJECT_PATH="."

for testF in $PROJECT_PATH/test-suite/*.wat
do
    echo "Test: $testF"
    wasm $testF -e '(invoke "$func0")'
done