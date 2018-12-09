# isa
println(isa(1, Int)) # true
println(isa(1, AbstractFloat)) # false

# typeof
println(typeof(Rational{Int})) # DataType
println(typeof(Union{Real, Float64, Rational})) # DataType
println(typeof(Union{Real, String}))            # Union
println(typeof(DataType))                       # DataType
println(typeof(Union))                          # DataType

# supertype
println(supertype(Float64)) # AbstractFloat
println(supertype(Number))  # Any
println(supertype(AbstractString)) # Any
println(supertype(Any))            # Any
# supertype(Union{Float64, Int64}) # ERROR: MethodError...

        
