

import argparse
import re

def transform_file(file, output):
    try:
        with open(file, "r", encoding="utf-8", newline="") as f:
            with open(output, "w", encoding="utf-8", newline="") as o:
                o.write(
                    """\n mod WASM-TEST-MOD is \n protecting WASMMOD . \n op test : -> WASMSimTrigger .
                        \n""")
                o.write(" eq test = run-module-func( \n ")
                for line in f.read().splitlines():
                    transformed_line = ""
                    if "const" in line:
                        transformed_line = re.sub(r'\.', ' .', line)
                    elif "local" in line or "global" in line:
                        transformed_line = line
                    else:
                        transformed_line = re.sub(r'\.', ' . ', line)
                    transformed_line = re.sub(r'\_', '~', transformed_line)
                    transformed_line = re.sub(r'~i', '~ i', transformed_line)
                    transformed_line = re.sub(r'~f', '~ f', transformed_line)
                    references_re = re.compile('\$(\w+)')
                    references = references_re.findall(transformed_line)
                    for ref in references:
                        transformed_line = re.sub(rf"\${ref}", rf'"${ref}"', transformed_line)
                        
                    o.write("\t" + transformed_line + "\n")
                o.write('\t , "$start") . \n')
                o.write('endm')
                o.close()
                f.close()

    except FileNotFoundError as excep:
        raise Exception("Wrong file or file path"+str(file)+"\n") from excep


parser = argparse.ArgumentParser(description="Transform WAT to WASMMAUDE syntax",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-f", "--file", action="store", help="Path to WAT file")
parser.add_argument("-o", "--output", action="store", help="Path to transformed file")
args = parser.parse_args()

transform_file(args.file, args.output)