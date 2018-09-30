function mult(a, b)
    a * b
end

m = mult

println(m(3, 9)) # 27

plustwo = x -> x + 2
plusthree = function (x) x + 3 end

println(plustwo(5))   # 7
println(plusthree(3)) # 6

# Function as arg
function numerical_derivative(f, x, dx=0.01)
    (f(x + dx) - f(x - dx)) / (2*dx)
end

f = x -> 2x^2 + 30x + 9
println(numerical_derivative(f, 1, 0.0001))


# Return funcs
function derivative(f)
    return function(x)
        # select small value for h to approx deriv
        h = x == 0 ? sqrt(eps(Float64)) : sqrt(eps(Float64)) * x
        xph = x + h
        dx = xph - x # why? dx = h
        f1 = f(xph) # eval f at x + h
        f0 = f(x)   # ''   '''' x
        return (f1 - f0) / dx
    end
end


function counter()
    n = 0
    () -> n += 1, () -> n = 0
end

(add_one, reset) = counter()
println(add_one) # 1
println(add_one) # 2
println(add_one) # 3
println(reset)   # 0


# Currying
function add(x)
    return function f(y)
        return x + y
    end
end

println(add(1)(2))

# can be written more succinctly as
add(x) = f(y) = x + y # or
add(x) = y -> x + y

println(add(7)(5))
