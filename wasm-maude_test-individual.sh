#!/usr/bin/bash

file="test-suite/br_withCall.wat"

test="erew search-with-func-from-file(\"$file\", \"\$func0\", 'w:WASMSimTrigger, nil, '!, unbounded, 0) . \n"

echo -e "load /bin/file.maude \n load tfm_RAFAEL_MORALES_PALACIOS.maude \n set trace on . \n $test " | maude -trust -no-banner