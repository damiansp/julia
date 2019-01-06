x = 10
x = "hello"

# (2 + 3)::String # TypeError ... expected String, got Int64


# Integers
# type Int defaults to Int64 on 64-bit architecture
# Available range is Int8-128
a = typemax(Int)
println(a)
println(a + 1)


# Floats (Float16-64)
println(2.5f2) # 250
println(1/0, -1/0) # Inf, -Inf
println(0/0, Inf - Inf) # NaN, NaN
