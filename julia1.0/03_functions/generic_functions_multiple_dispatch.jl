f(n, m) = "base case"
f(n::Number, m::Number) = "n and m are both numbers"
f(n::Number, m) = "n is a number"
f(n, m::Number) = "m is a number"
f(n::Integer, m::Integer) = "n and m are both ints"

println(f(1.5, 2))
println(f(1, "bar"))
println(f(1, 2))
println(f("foo", [1, 2]))
