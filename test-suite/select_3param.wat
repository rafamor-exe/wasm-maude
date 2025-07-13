(module
      (export "$func0" (func 0))
      (func $func0 (result i32 i32 i64 i64
                           f32 f32 f64 f64)
            i32.const 1
            i32.const 2
            i32.const 0
            select  

            i32.const 1
            i32.const 2
            i32.const 1
            select

            i64.const 1
            i64.const 2
            i32.const 0
            select  

            i64.const 1
            i64.const 2
            i32.const 1
            select

            f32.const 1
            f32.const 2
            i32.const 0
            select

            f32.const 1
            f32.const 2
            i32.const 1
            select  

            f64.const 1
            f64.const 2
            i32.const 0
            select

            f64.const 1
            f64.const 2
            i32.const 1
            select  
      )
)
