(module
      (export "$func0" (func 0))
      (func $func0 (result i32 f32 f64)
            i64.const 0
            i32.wrap_i64

            f64.const 0
            f32.demote_f64

            f32.const 0
            f64.promote_f32
      )
)
