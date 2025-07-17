(module
      (export "$func0" (func 0))
      (func $func0 (result i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
            f32.const %randf32_1%
            f32.const %randf32_2%
            f32.eq

            f32.const %randf32_1%
            f32.const %randf32_2%
            f32.ne

            f32.const %randf32_1%
            f32.const %randf32_2%
            f32.lt

            f32.const %randf32_1%
            f32.const %randf32_2%
            f32.gt

            f32.const %randf32_1%
            f32.const %randf32_2%
            f32.le

            f32.const %randf32_1%
            f32.const %randf32_2%
            f32.ge

            f64.const %randf64_1%
            f64.const %randf64_2%
            f64.eq

            f64.const %randf64_1%
            f64.const %randf64_2%
            f64.ne

            f64.const %randf64_1%
            f64.const %randf64_2%
            f64.lt

            f64.const %randf64_1%
            f64.const %randf64_2%
            f64.gt

            f64.const %randf64_1%
            f64.const %randf64_2%
            f64.le

            f64.const %randf64_1%
            f64.const %randf64_2%
            f64.ge
      )
)
