(module
      (export "$func0" (func 0))
      (func $func0 (result i32 f32 i64 f64 i32 f32 i64 f64)
            global.get $gb0
            global.get $gb1
            global.get $gb2
            global.get $gb3
            
            global.get $gb4
            global.get $gb5
            global.get $gb6
            global.get $gb7     
      )
      (global $gb0 (mut i32) (i32.const 0))
      (global $gb1 (mut f32) (f32.const 0))
      (global $gb2 (mut i64) (i64.const 0))
      (global $gb3 (mut f64) (f64.const 0))

      (global $gb4 i32 (i32.const 0))
      (global $gb5 f32 (f32.const 0))
      (global $gb6 i64 (i64.const 0))
      (global $gb7 f64 (f64.const 0))
)
