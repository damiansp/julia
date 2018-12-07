struct Point
  x::Float64
  y::Float64
  z::Float64
end

p1 = Point(3, 4, 5)
println(typeof(p1)) # Point

orig = Point(0, 0, 0)
p2 = Point(2, 4, 1.3)

println(p2.z)
#p2.z = 5.5 # type Point is immutable


#immutable Vector3D
#  x::Float64
#  y::Float64
#  z::Float64
#end

#3 = Vector3D(1, 2, 3)
#p.y = 5
