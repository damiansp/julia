abstract type Pointy{T} end

println(Pointy{Int64} <: Pointy) # true
println(Pointy{Float64} <: Pointy) # false
println(Pointy{Real} <: Pointy{Float64}) # false

println(Pointy{Float64} <: Pointy{<:Real}) # true
println(Pointy{Real} <: Pointy{>:Int})     # true


struct Point{T} <: Pointy{T}
    x::T
    y::T
end

println(Point{Float64} <: Pointy{Float64}) # true
println(Point{Real} <: Pointy{Real})       # true
println(Point{AbstractString} <: Pointy{AbstractString}) # true
println(Point{Float64} <: Pointy{Real})                  # false
println(Point{Float64} <: Pointy{<:Real})                # true


struct DiagPoint{T} <: Pointy{T}
    x::T
end


abstract type Pointy2{T <: Real} end

struct Point2{T <: Real} <: Pointy2{T}
    x::T
    y::T
end

struct Rational{T <: Integer} <: Real
    num::T
    den::T
end

