(module
      (export "$func0" (func 0))
      (func $func0 (result f32 f32 f32 f32 f32 f32 f32
                           f64 f64 f64 f64 f64 f64 f64)
            f32.const 2
            f32.const 3
            f32.add

            f32.const 2
            f32.const 3
            f32.sub

            f32.const 2
            f32.const 3
            f32.mul
            
            f32.const 2
            f32.const 3
            f32.div
            
            f32.const 2
            f32.const 3
            f32.min
            
            f32.const 2
            f32.const 3
            f32.max
            
            f32.const 2
            f32.const 3
            f32.copysign

            f64.const 2
            f64.const 3
            f64.add

            f64.const 2
            f64.const 3
            f64.sub

            f64.const 2
            f64.const 3
            f64.mul
            
            f64.const 2
            f64.const 3
            f64.div
            
            f64.const 2
            f64.const 3
            f64.min
            
            f64.const 2
            f64.const 3
            f64.max
            
            f64.const 2
            f64.const 3
            f64.copysign
      )
)