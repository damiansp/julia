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
