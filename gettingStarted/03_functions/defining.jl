# function fname(arglist)
#     # body...
#     return vals
# end

function mult(x, y)
    println("x is $x and y is $y\nxy = $(x * y)")
    #return x * y  # or simply
    x * y
end

x = 7
y = 9
mult(x, y)


function mult2(x, y)
    println("x is $x and y is $y")
    if x == 1
        return y
    end
    return x * y
end

println(mult2(x, y))


function multi(n, m)
    n*m, div(n, m), n % m
end

println(multi(y, x))
prod, quot, rem = multi(y, x)
println("$prod\n$quot\n$rem")

function varargs(n, m, args...)
    println("args:\n $n\n $m\n $args")
end

varargs(1, 2, 3, 4, 5)

function varargs2(args...)
    println("args: $args")
end

x = [10, 11, 12]
varargs2(1, 2, x)

function insert_elem(arr)
    push!(arr, -10)
end

arr = [2, 3, 4]
insert_elem(arr)
println(arr)

function float64_mult(x::Float64, y::Float64)
    println("x is $x and y is $y\nxy = $(x * y)")
    return x * y
end

short_mult(x, y) = x * y
println(short_mult(4, 7))
