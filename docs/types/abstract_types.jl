# Syntax
# abstract type name end
# abstract tye name <: supertype end
# supertype is Any by default

abstract type Number end
abstract type Real <: Number end
abstract type AbstractFloat <: Real end
abstract type Integer <: Real end
abstract type Signed <: Integer end
abstract type Unsigned <: Integer end

println(Integer <: Number) # true
println(Integer <: AbstractFloat) # false

function myplus(x, y)
    x + y
end

function myplus2(x::Int, y::Int)
    x + y
end


