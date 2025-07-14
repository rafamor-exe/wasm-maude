#!/usr/bin/bash

test_all=""

for testF in test-suite/*
do
    test_all+="erew search-with-func-from-file(\"$testF\", \"\$func0\", 'w:WASMSimTrigger, nil, '!, unbounded, 0) . \n"
    
done
echo -e "load /bin/file.maude \n load tfm_RAFAEL_MORALES_PALACIOS.maude \n $test_all " | maude -trust -no-banner