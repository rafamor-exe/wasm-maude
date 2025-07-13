

import argparse
import re

def transform_file(file, output):
    try:
        with open(file, "r", encoding="utf-8", newline="") as f:
            with open(output, "w", encoding="utf-8", newline="") as o:
                o.write("run-module-func(")
                for line in f.read().splitlines():
                    transformed_line = ""
                    if "const" in line:
                        transformed_line = re.sub(r'\.', ' .', line)
                    elif "local" in line or "global" in line:
                        transformed_line = line
                    else:
                        transformed_line = re.sub(r'\.', ' . ', line)
                    transformed_line = re.sub(r'\_', '~', transformed_line)
                    o.write(transformed_line)
                o.write(',"start") .')
                o.close()
                f.close()

    except FileNotFoundError as excep:
        raise Exception("Wrong file or file path"+str(file)+"\n") from excep


parser = argparse.ArgumentParser(description="Trasnform WAT to WASMMAUDE syntax",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-f", "--file", action="store", help="Path to WAT file")
parser.add_argument("-o", "--output", action="store", help="Path to transformed file")
args = parser.parse_args()

transform_file(args.file, args.output)