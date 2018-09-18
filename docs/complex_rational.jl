# Complex numbers
println(1 + 2im)
z = 1 + 2im
println(z)
println(real(z))
println(imag(z))
println(abs(z)) # norm/magnitude
println(angle(z)) # in rad

#println(sqrt(-1)) # DomainError
println(sqrt(-1 + 0im))



# Rational Numbers
frac = 2 // 3
println(frac)
println(numerator(frac))
println(denominator(frac))
println(float(frac))
