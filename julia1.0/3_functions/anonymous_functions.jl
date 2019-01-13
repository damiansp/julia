function mult(a, b)
  a * b
end

m = mult
println(m(6, 6)) # 36

function numerical_derivative(f, x, dx=0.01)
  deriv = (f(x + dx) - f(x - dx)) / (2*dx)
  deriv
end

f = x -> 2x^2 + 30x + 9 # df/dx = 4x + 30
println(numerical_derivative(f, 1, 0.001)) # 33.99999 (exact is 34)


function derivative(f)
  return function(x)
    h = x == 0 ? sqrt(eps(Float64)) : sqrt(eps(Float64)) * x
    xph = x + h
    f0 = f(x)
    f1 = f(xph)
    (f1 - f0) / h
  end
end


# Closure example
function counter()
  n = 0
  () -> n += 1, () -> n = 0
end

(add_one, reset) = counter()
println(add_one()) # 1
println(add_one()) # 2
println(add_one()) # 3
println(reset())   # 0


# Currying example
function add(x)
  return function(y)
    x + y
  end
end

println(add(1)(3)) # 4

# more concisely
add(x) = f(y) = x + y

# or
add(x) = y -> x + y

