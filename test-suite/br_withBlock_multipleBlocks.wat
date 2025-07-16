(module
      (export "$func0" (func 0))
      (func $func0 (result i32)
            block (result i32)
                  i32.const 0
                  block (result i32)
                        i32.const 1
                        br 1
                        i32.const 2
                  end
                  br 0
                  i32.const 3
            end
      )
)
