(module
      (export "$func0" (func 0))
      (func $func0 (result i32 i32 i32 i32 i32 i32 i32 
                           i64 i64 i64 i64 i64 i64 i64)
            i32.const %randi32_1%
            i32.const %randi32_2%
            i32.add

            i32.const %randi32_1%
            i32.const %randi32_2%
            i32.sub

            i32.const %randi32_1%
            i32.const %randi32_2%
            i32.mul
            
            i32.const %randi32_1%
            i32.const %randi32_2%
            i32.div_u
            
            i32.const %randi32_1%
            i32.const %randi32_2%
            i32.div_s
            
            i32.const %randi32_1%
            i32.const %randi32_2%
            i32.rem_u
            
            i32.const %randi32_1%
            i32.const %randi32_2%
            i32.rem_s

            i64.const %randi64_1%
            i64.const %randi64_2%
            i64.add

            i64.const %randi64_1%
            i64.const %randi64_2%
            i64.sub

            i64.const %randi64_1%
            i64.const %randi64_2%
            i64.mul
            
            i64.const %randi64_1%
            i64.const %randi64_2%
            i64.div_u
            
            i64.const %randi64_1%
            i64.const %randi64_2%
            i64.div_s
            
            i64.const %randi64_1%
            i64.const %randi64_2%
            i64.rem_u
            
            i64.const %randi64_1%
            i64.const %randi64_2%
            i64.rem_s
            
      )
)