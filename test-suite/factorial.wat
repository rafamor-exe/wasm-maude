(module
    (type $type0 (func (result i32)))
    (type $type1 (func (param i32) (result i32)))
    (export "$start" (func 0))
    (func $start (type $type0)
        i32.const 5
        call $factorial
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
