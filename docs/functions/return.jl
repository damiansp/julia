function g(x, y)
    return x * y
    x + y # unreachable
end

println(g(2, 3)) # 6


function hypot(x, y)
    x = abs(x)
    y = abs(y)
    if x > y
        r = y / x # avoid overflow
        return x*sqrt(1 + r*r)
    end
    if y == 0
        return zero(x)
    end
    r = x / y
    return y*sqrt(1 + r*r)
end

println(hypot(3, 4)) # 5.0


function g(x, y)::Int8 # declare return type
    return x * y
end

println(g(3, 4))         # 12
println(typeof(g(3, 4))) # Int8
