println(isequal(5, 5)) # true
println(isequal(5, 5.0)) # true

println(5 === 5) # true
println(5 === 5.0) # false


struct Vector3D
  x::Float64
  y::Float64
  z::Float64
end

q = Vector3D(4.0, 3.14, 2.71)
r = Vector3D(4.0, 3.14, 2.71)
println(isequal(q, r)) # true
println(q === r)       # true


mutable struct MVector3D
  x::Float64
  y::Float64
  z::Float64
end

u = MVector3D(4.0, 3.14, 2.71)
v = MVector3D(4.0, 3.14, 2.71)
println(isequal(u, v)) # false
println(u === v)       # false
