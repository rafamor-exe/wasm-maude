let source = '(module (func (export "f") (param i32 i32) (result i32) (i32.add (local.get 0) (local.get 1))))'
let binary = WebAssemblyText.encode(source)

(new WebAssembly.Instance(new WebAssembly.Module(binary))).exports.f(3, 4)