mutable struct Point{T}
  x::T
  y::T
end


mutable struct RealPoint{T <: Real}
  x::T
  y::T
end


function vec_float(x::Vector{T}) where T <: AbstractFloat
  # ...
end
