(module
  (export "as-block-first" (func 0))
  (export "$38" (func 9))
  (type $0 (func (param i32 i32 i32) (result i32)))
  (type $2 (func (result i32)))

  (func $0 (nop) )

  (func $14 (block (br 0) (call 0) end))
  (func $15  (block (call 0) (br 0) (call 0) end))
  (func $16  (block (nop) (call 0) (br 0) end))
  (func $17 (type $2) (block (result i32) (nop) (call 0) (i32.const 2) (br 0) end)) 

  (func $18
    (type $2)
    (block (result i32) (loop (result i32) (i32.const 3) (br 1) (i32.const 2) end) end)
  )

  (func $19
    (type $2)
    (block
      (result i32)
      (loop (result i32) (call 0) (i32.const 4) (br 1) (i32.const 2) end)
    end)
  )

  (func $20
    (type $2)
    (block (result i32) (loop (result i32) (nop) (call 0) (i32.const 5) (br 1) end) end)
  )

  (func $37 (param i32 i32 i32) (result i32) (i32.const -1))
  (func $38 (result i32)
    block (result i32)
      i32.const 12
      br 0
      i32.const 2
      i32.const 3
      call $37
    end
  )
)
