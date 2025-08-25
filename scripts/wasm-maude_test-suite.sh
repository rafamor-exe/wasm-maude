#!/usr/bin/bash

MAUDE_LIBRARY="/bin"
PROJECT_PATH="."

test_all=""

for testF in $PROJECT_PATH/test-suite/*.wat
do
    test_all+="erew search-with-func-from-file(\"$testF\", \"\$func0\", 'w:WASMEnvTrigger, nil, '!, unbounded, 0) . \n"
    
done
echo -e "load $MAUDE_LIBRARY/file.maude \n load $PROJECT_PATH/wasm-maude-semantics.maude \n $test_all " | $MAUDE_LIBRARY/maude -trust -no-banner