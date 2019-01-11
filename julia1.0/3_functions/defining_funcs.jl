function mult(x, y)
    println("x: $x, y: $y")
    if x == 1
        return y
    end
    x * y
end

function multi(n, m)
    n*m, div(n, m), n%m
end

function varargs(n, m, args...)
    println("args: $n $m $args")
end

function varargs2(args...)
    println("args: $args")
end

varargs(7, 8, 9) # args: 7 8 (9,)9

function insert_elem!(arr)
    push!(arr, -10)
end

arr = [2, 3, 4]
insert_elem!(arr)
println(arr) # 2 3 4 -10

function float_mult(x::Float64, y::Float64)
    x * y
end

f(x, y) = x^3 - y + 2x
println(f(2, 3))

f(a, b=5) = a + b
k(x; a1=1, a2=2) = x*(a1 + a2)

function allargs(normal_arg, opt_positional_arg=2; keyword_arg="abc")
    println("  Normal arg: $normal_arg")
    println("  Optional arg: $opt_positional_arg")
    println("  Keyword arg: $keyword_arg")
end

allargs(7, keyword_arg="five")
