a = 4
b = 3
println(a \ b) # same as b / a
println(a ÷ b) # int division (truncated)
println([1, 2, 3] .^ 3)
println([1 2 3] .^ 3)
println(NaN == NaN) # false
println([1 NaN] == [1 NaN]) # false

# Useful:
# isequal(x)
# isfinite(x)
# isinf(x)
# isnan(x)
println(isequal(NaN, NaN)) # true
println(isequal(NaN, NaN32)) # true

println(1 < 2 <= 2 < 3 == 3 > 2 >= 1 == 1 < 3 != 5) # true


x = 7.0
println(mod2pi(x)) # 0.7168...
println(divrem(23, 7)) # (3, 2)
println(gcd(3, 9))     # 3
println(lcm(7, 9))     # 63

println(abs2(5)) # 25 (squared magnitude of 5)

println(hypot(3, 4)) # 5.0
