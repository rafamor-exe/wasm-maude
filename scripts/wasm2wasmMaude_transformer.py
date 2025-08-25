import argparse
import re

def transform_file(file, output, func):
    try:
        with open(file, "r", encoding="utf-8", newline="") as f:
            with open(output, "w", encoding="utf-8", newline="") as o:
                o.write(
                    """\nmod WASM-TEST-MOD is \n protecting WASMMOD . \n op test : -> WASMEnvTrigger .
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
                    transformed_line = re.sub(r'~i\d', '~ i', transformed_line)
                    transformed_line = re.sub(r'~f', '~ f', transformed_line)
                    references_re = re.compile('\$(\w+)')
                    references = references_re.findall(transformed_line)
                    for ref in references:
                        transformed_line = re.sub(rf"(?<!\")\${ref}", rf'"${ref}"', transformed_line)
                        
                    o.write("\t" + transformed_line + "\n")
                o.write('\t , "'+func+'") . \n')
                o.write('endm')
                o.close()
                f.close()

    except FileNotFoundError as excep:
        raise Exception("Wrong file or file path"+str(file)+"\n") from excep

####
# python3 wasm2wasmMaude_transformer.py -f examples/factorial_pytesting.wat.og -o examples/factorial_pytesting.wat.transform 

parser = argparse.ArgumentParser(description="Transform WAT to WASMMAUDE syntax",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-f", "--file", action="store", help="Path to WAT file")
parser.add_argument("-o", "--output", action="store", help="Path to transformed file")
parser.add_argument("-e", "--function", action="store", help="Function to invoke. Can be modified later.")
args = parser.parse_args()

transform_file(args.file, args.output, args.function)