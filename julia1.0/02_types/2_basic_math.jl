println(bitstring(3)) # 00000....00011
x = 10 * rand()

println(sqrt(x))
println(cbrt(x))
println(exp(x))
println(log(x))
println(sin(x))
println(cos(x))
println(tan(x))

a = 1
b = 10
a, b = b, a

println(true && false) # false
println(true || false) # true
println(!true)         # false

# & and | also exist as non-short-circuiting versions
println((a += 1) == (a -= 1)) # false


# Rational and Complex Numbers
c = 3.2 + 7.1im
#println(sqrt(-1)) # ERROR
println(sqrt(-1+0im))
println(typeof(c))
println(abs(c)) # = magnitude of vector
r = 3 // 4
println(r) # 3//4
println(typeof(r)) # Rational{Int64}
println(float(r))  # 0.75
println(r.num, " ", r.den) # 3 4
