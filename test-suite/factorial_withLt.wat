(module
    (type $type0 (func (result i32)))
    (type $type1 (func (param i32) (result i32)))
    (export "$func0" (func 0))
    (func $func0 (type $type0)
        i32.const 5
        call $func1
    )
    (func $func1 (type $type1)
        local.get 0
        i32.const 0
        i32.lt_s
        if (result i32)
            i32.const -1
        else
            local.get 0
            call $factorial
        end
    )
    (func $factorial (type $type1)
        i32.const 0
        local.get 0
        i32.eq
        if (result i32)
            i32.const 1
        else
            local.get 0
            local.get 0
            i32.const 1
            i32.sub
            call $factorial
            i32.mul
        end
    )
)
