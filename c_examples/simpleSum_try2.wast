(module
 (type $none_=>_none (func))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (export "__wasm_call_ctors" (func $0))
 (export "__original_main" (func $1))
 (export "main" (func $2))
 (func $0
  (nop)
 )
 (func $1 (result i32)
  (i32.const 0)
 )
 (func $2 (param $0 i32) (param $1 i32) (result i32)
  (i32.const 0)
 )
 ;; dylink section
 ;;   memorysize: 0
 ;;   memoryalignment: 0
 ;;   tablesize: 0
 ;;   tablealignment: 0
)

