#!/usr/bin/bash

file=$1
func=$2

test="erew search-with-func-from-file(\"$file\", \"$func\", 'w:WASMSimTrigger, nil, '!, unbounded, 0) . \n"

echo -e "load /bin/file.maude \n load tfm_RAFAEL_MORALES_PALACIOS.maude \n set trace on . \n $test " | maude -trust -no-banner