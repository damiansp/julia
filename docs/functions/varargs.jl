bar(a, b, x...) = (a, b, x)

println(bar(1, 2))          # (1, 2, ())
println(bar(1, 2, 3))       # (1, 2, 3)
println(bar(1, 2, 3, 4, 5)) # (1, 2, (3, 4, 5))

x = (3, 4)
println(bar(1, 2, x...)) # (1, 2, (3, 4))

x = (2, 3, 4)
println(bar(1, x...))    # (1, 2, (3, 4))

x = (1, 2, 3, 4)
println(bar(x...))       # (1, 2, (3, 4))

x = [3, 4]
println(bar(1, 2, x...)) # (1, 2, (3, 4))


baz(a, b) = a + b
args = [1, 2]

println(baz(args...)) # 3

