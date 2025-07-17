(module
      (export "$func0" (func %randf64_1%))
      (func $func0 (result f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64 f64
                           f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32 f32)
            f64.const %randf64_1%
            f64.abs
            f64.const %randf64_1%
            f64.neg
            f64.const %randf64_1%
            f64.sqrt
            f64.const %randf64_1%
            f64.ceil
            f64.const %randf64_1%
            f64.floor
            
            f32.const %randf32_1%
            f32.abs
            f32.const %randf32_1%
            f32.neg
            f32.const %randf32_1%
            f32.sqrt
            f32.const %randf32_1%
            f32.ceil
            f32.const %randf32_1%
            f32.floor
      )
)
