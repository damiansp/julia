mutable struct Point
  x::Float64
  y::Float64
  z::Float64
end

p1 = Point(1.0, 3.0, 4.0)
println(fieldnames(Point))
println(p1.y)

