#!/usr/bin/bash

MAUDE_LIBRARY="/bin"
PROJECT_PATH="."

TEMPLATE_TEST_DIR="${PROJECT_PATH}/test-suite/randomized"
TMP_TEST_DIR="${TEMPLATE_TEST_DIR}/tmp-test"

rm -rf ${TMP_TEST_DIR}

mkdir ${TMP_TEST_DIR}

cp ${TEMPLATE_TEST_DIR}/*.wat ${TMP_TEST_DIR}/

i32_rand1=$(od -An -N4 -td4 < /dev/urandom)
i32_rand2=$(od -An -N4 -td4 < /dev/urandom)

i64_rand1=$(od -An -N8 -td8 < /dev/urandom)
i64_rand2=$(od -An -N8 -td8 < /dev/urandom)

f32_rand1=$(dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tfF)
f32_rand2=$(dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tfF)

f64_rand1=$(dd if=/dev/urandom bs=8 count=1 2>/dev/null | od -An -tfD)
f64_rand2=$(dd if=/dev/urandom bs=8 count=1 2>/dev/null | od -An -tfD)

echo $i32_rand1
echo $i32_rand2
echo $i64_rand1
echo $i64_rand2
echo $f32_rand1
echo $f32_rand2
echo $f64_rand1
echo $f64_rand2


test_all=""

for testF in ${TMP_TEST_DIR}/*.wat
do
    sed -i "s/%randi32_1%/$i32_rand1/g " $testF
    sed -i "s/%randi32_2%/$i32_rand2/g" $testF

    sed -i "s/%randi64_1%/$i64_rand1/g" $testF
    sed -i "s/%randi64_2%/$i64_rand2/g" $testF

    sed -i "s/%randf32_1%/$f32_rand1/g" $testF
    sed -i "s/%randf32_2%/$f32_rand2/g" $testF

    sed -i "s/%randf64_1%/$f64_rand1/g" $testF
    sed -i "s/%randf64_2%/$f64_rand2/g" $testF

    wasm $testF -e '(invoke "$func0")' >> ${TMP_TEST_DIR}/wasm.dump

    test_all+="erew search-with-func-from-file(\"$testF\", \"\$func0\", 'w:WASMEnvTrigger, nil, '!, unbounded, 0) . \n"
    
done

echo -e "load $MAUDE_LIBRARY/file.maude \n load $PROJECT_PATH/wasm-maude-semantics.maude \n $test_all " | $MAUDE_LIBRARY/maude -trust -no-banner > ${TMP_TEST_DIR}/wasmmaude.dump

python3 ${PROJECT_PATH}/scripts/wasmVSwasmMaude_test-eval.py -w ${TMP_TEST_DIR}/wasm.dump -m ${TMP_TEST_DIR}/wasmmaude.dump

rm -rf ${TMP_TEST_DIR}