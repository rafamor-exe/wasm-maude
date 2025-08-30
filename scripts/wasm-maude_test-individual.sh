#!/usr/bin/bash

MAUDE_LIBRARY="/bin"
PROJECT_PATH="."

file=$1
func=$2
initIL=$3

test="erew search-with-func-from-file(\"$file\", \"$func\", \"$initIL\", 'w:WASMEnv, nil, '!, unbounded, 0) . \n"

echo -e "load $MAUDE_LIBRARY/file.maude \n load $PROJECT_PATH/wasm-maude-semantics.maude \n set trace on . \n $test " | $MAUDE_LIBRARY/maude -trust -no-banner