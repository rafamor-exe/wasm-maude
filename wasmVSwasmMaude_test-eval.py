import argparse
import re

def eval(wasmF, maudeF):
    try:
        with open(wasmF, "r", encoding="utf-8", newline="") as w:
            with open(maudeF, "r", encoding="utf-8", newline="") as m:
                mDump = m.read()
                wDump = w.read()
                #maudeStack = mDump[mDump.find("nil |")+6:mDump.find("| empty")]
                mDump = mDump.replace("\n"," ")
                #wDump = wDump.replace("\n"," ")

                maudeStacks = re.findall(r'nil \|(.*?)\| empty', mDump)
                #print(maudeStacks)
                
                # slice list to get the second element
                maudeStacks = maudeStacks[::2]
                maudeStacksL = []
                for maudeStack in maudeStacks:
                    #print(str(maudeStack) + "\n")
                    maudeStacksL.append(
                        ([elem.replace("(", "").replace("zeroneg", "-0").replace("zeropos", "+0").replace("nansnil", "nan").replace("infpos", "inf").replace("infneg", "-inf") for elem in re.findall(r'val\((.*?)\)', maudeStack)], re.findall(r'const\((.*?),', maudeStack))
                        )
                i = 0
                for (values, tokens) in maudeStacksL:
                    values.reverse()
                    tokens.reverse()
                    print(maudeStacksL[i])
                    i += 1
                wasmStackL = []
                for wasmStack in wDump.splitlines():
                    #print(str(maudeStack) + "\n")
                    wasmStackL.append(
                        ([elem.replace("_", "").split(' ') for elem in re.findall(r'\[(.*?)\] \:', wasmStack)][0], [elem.split(' ') for elem in re.findall(r'\: \[(.*?)\]', wasmStack)][0])
                        )
                print(wasmStackL)
                tests_passed = 0
                tests_failed = []
                for i in range(0, len(wasmStackL)):
                    if maudeStacksL[i] == wasmStackL[i]:
                        tests_passed += 1
                    else:
                        tests_failed.append((maudeStacksL[i], wasmStackL[i]))
                print("Tests passed: " + str(tests_passed) + " / " + str(len(wasmStackL)))
                print("Tests failed:")
                for fail in tests_failed:
                     print("FAIL:")
                     print(fail)
                #print(maudeStacksL)
                #print(wDump)
                m.close()
                w.close()

    except FileNotFoundError as excep:
        raise Exception("Wrong file or file path "+str(wasmF)+" or "+str(maudeF)+"\n") from excep

####
# python3 wasm2wasmMaude_transformer.py -f examples/factorial_pytesting.wat.og -o examples/factorial_pytesting.wat.transform 

parser = argparse.ArgumentParser(description="Transform WAT to WASMMAUDE syntax",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-w", "--wasm-dump", action="store", help="Path to wasm test dump file")
parser.add_argument("-m", "--maude-dump", action="store", help="Path to maude test dump file")
args = parser.parse_args()

eval(args.wasm_dump, args.maude_dump)