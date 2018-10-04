function f(x, y)
    x + y
end

println(f(2, 3)) # 5


f(x, y) = x + y
g = f

println(g(3, 4)) # 7


