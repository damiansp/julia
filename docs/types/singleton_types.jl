println(isa(Float64, Type{Float64})) # true
println(isa(Real, Type{Float64}))    # false
println(isa(Real, Type{Real}))       # true
println(isa(Float64, Type{Real}))    # false

# isa(A, Type{B}) -> true iff A, B are same object and obj is a type
println(isa(Type{Float64}, Type)) # true
println(isa(Float64, Type))       # true
println(isa(Real, Type))          # true
println(isa(1, Type))             # false
println(isa("foo", Type))         # false
