(module
      (export "$func0" (func 0))
      (func $func0 (result i32 i32)
            block (result i32 i32)
            call $func1
            i32.const 1
            end
      )
      (func $func1 (result i32)
            block (result i32)
            i32.const 2
            br 1
            i32.const 3
            end
      )
)
