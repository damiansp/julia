type Point
  x::Float64
  y::Float64
  z::Float64
end

p1 = Point(3, 4, 5)
println(typeof(p1)) # Point
println(subtypes(Point))
