#!/usr/bin/bash

file="examples/factorial_valid_br_jump.wat"

test="erew search-with-func-from-file(\"$file\", \"\$start\", 'w:WASMSimTrigger, nil, '!, unbounded, 0) . \n"

echo -e "load /bin/file.maude \n load tfm_RAFAEL_MORALES_PALACIOS.maude \n set trace on . \n $test " | maude -trust -no-banner