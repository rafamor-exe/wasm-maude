(module
      (type $type0 (func (result i64)))
      (type $type1 (func (param i64) (result i64)))
      (export "start" (func 0))
      (func $start (result i32)
        (local i32)
        
            i64.const 5
            global.set $gb1
            global.get $gb1
            call $factorial
            i32.wrap_i64
        
        )
      (func $factorial (type $type1)

            i64.const 0
            local.get 0
            i64.eq
            if (result i64)
                i64.const 1
            else
                local.get 0
                local.get 0
                i64.const 1
                i64.sub
                call $factorial
                i64.mul
            end
        
        )
      (global $gb1 (mut i64) (i64.const 1))
      (global $result (mut i32) (i32.const 1))
)
