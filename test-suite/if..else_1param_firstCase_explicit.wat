(module
      (export "$func0" (func 0))
      (type $type1 (func (param i32) (result i32 i32)))
      (func $func0 (result i32 i32)
            i32.const 0
            i32.const 1
            if (param i32) (result i32 i32)
                i32.const 1
            else
                i32.const 2
            end    
      )
)
