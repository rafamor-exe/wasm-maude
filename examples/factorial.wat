(module
      (import "console" "log" (func $log (param i32)))
      (global $gb1 (mut i32) (i32.const 1))
      (global $result (mut i32) (i32.const 1))
      (func $start
       (local i32)
        
            (i32.const 5)
            (global.set $gb1)
            (global.get $gb1)
            (call $factorial)
            (call $log)
        
        )
      (func $factorial (param i32) (result i32)
       (local i32)
        
            (i32.const 0)
            (local.get 0)
            (i32.eq)
            if (result i32)
                (i32.const 1)
            else
                (local.get 0)
                (local.get 0)
                (i32.const 1)
                (i32.sub)
                (call $factorial)
                (i32.mul)
            end           
        
        )
        (start $start)
)
