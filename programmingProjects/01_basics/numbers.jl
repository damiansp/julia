# Integers
println(42)
println(typeof(42)) # Int64
@show Int           # Int = Int64


# Overflow
println("$(typemin(Int)), $(typemax(Int))")
println(typemin(Int) - 1 == typemax(Int)) # true
println(BigInt(typemax(Int)) + 1)


# Floats
println(1_000_000)     # improve legibility
println(0.000_000_005)


# Rational
println(3//2)             # 3//2
println(1//2 + 2//4)      # 1//1
println(Int(1//2 + 2//4)) # 1
#println(Int(1//3))       # InexactError
println(float(1//3))      # 0.333333


# Vectorized Dot Operators
