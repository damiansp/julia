# 32-bit system pointer
#primitive type Ptr{T} 32 end

# 64-bit
primitive type Ptr{T} 64 end

println(Ptr{Float64} <: Ptr) # true
println(Ptr{Int64} <: Ptr)   # true
