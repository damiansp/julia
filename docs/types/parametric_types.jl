struct Point{T}
    x::T
    y::T
end


Point{Float64}
Point{AbstractString}

println(Point{Float64} <: Point) # true
println(Point{AbstractString} <: Point) # true
println(Point{Float64} <: Point{Real}) # false


function norm(p::Point{<:Real}) # accept Point{T} if T <: Real
    sqrt(p.x^2 + p.y^2)
end

p = Point{Float64}(1., 2.)
println(p)
println(typeof(p))
xs
