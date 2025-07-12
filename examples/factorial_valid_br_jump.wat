(module
      (type $type0 (func (result i64)))
      (type $type1 (func (param i64) (result i64)))
      (type $type2 (func (param i64) (result i64)))
      (func $start
        (local i32)
        
            i64.const 5
            global.set $gb1
            global.get $gb1
            (block (type $type2)
            br 0
            call $factorial
            end)
            global.set $result
        
        )
      (func $factorial (type $type1)
        
            i64.const 0
            local.get 0
            i64.eq
            (if (i64)
                i64.const 1
            else
                local.get 0
                local.get 0
                i64.const 1
                i64.sub
                call $factorial
                i64.mul
            end)
        
        )
      (global $gb1 (mut i64) (i64.const 1))
      (global $result (mut i64) (i64.const 1))
)
