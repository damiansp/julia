x = 'x'
println("typeof(x): ", typeof(x))
println("x is a String: ", isa(x, String))
println(string(x))

println("7 / 3 = ", 7 / 3)
println("div(7, 3) = ", div(7, 3)) # integer division

println("7 % 3 = ", 7 % 3)         # both work
println("rem(7, 3) = ", rem(7, 3))

println("bits(41): ", bitstring(41))
println("bits(3.14): ", bitstring(3.14))

println("round(9.97) ", round(9.97))
println("round(Int64, 9.97) ", round(Int64, 9.97))

println("rand(): ", rand())

println("sqrt(-1): ", im)
println(3.2 + 7.1im)

a = 5
b = 2
println(complex(a, b))

tt = 2 // 3
println(numerator(tt), '/', denominator(tt))
