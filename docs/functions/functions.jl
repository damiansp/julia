function f(x, y)
    x + y
end

println(f(2, 3)) # 5


f(x, y) = x + y
g = f

println(g(3, 4)) # 7


# multiple returns
function foo(a, b)
    a + b, a * b
end

println(foo(3, 4))

sm, prd = foo(4, 5)
println(sm)
println(prd)


minmax(x, y) = (y < x) ? (y, x) : (x, y)
range((min, max)) = max - min

println(range(minmax(10, 2))) # 8
