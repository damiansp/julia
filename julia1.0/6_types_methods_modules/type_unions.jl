import Base.+

mutable struct Point
  x::Float64
  y::Float64
end


mutable struct Vector2D
  x::Float64
  y::Float64
end

p = Point(2, 5)
v = Vector2D(3, 2)

# +(p, v) # ERROR no + method defined for these types
VecOrPoint = Union{Vector2D, Point}
#+(p::Point, q::Point) = Point(p.x + q.x, p.y + q.y)
#+(u::Vector2D, v::Vector2D) = Vector2D(u.x + v.x, u.y + v.y)
#+(u::Vector2D, p::Point) = Vector2D(u.x + p.x, u.y + p.y)
+(u::VecOrPoint, v::VecOrPoint) = VecOrPoint(u.x + v.x, u.y + v.y)

