mutable struct Position
	x::Int
	y::Int
end

struct Size
	width::Int
	height::Int
end

struct Widget
	name::String
	position::Position
	size::Size
end


abstract type Thing end

position(t::Thing) = t.position
size(t::Thing) = t.size
shape(t::Thing) = :unknown

@enum Weapon Laser Missile


struct Spaceship <: Thing
	position::Position
	size::Size
	weapon::Weapon
end

shape(s::Spaceship) = :saucer


struct Asteroid <: Thing
	position::Position
	size::Size
end

s1 = Spaceship(Position(0, 0), Size(30, 5), Missile)
s2 = Spaceship(Position(10, 0), Size(30, 5), Laser)
a1 = Asteroid(Position(20, 0), Size(20, 20))
a2 = Asteroid(Position(0, 20), Size(20, 20))

println(position(s1), size(s1), shape(s1))
println(position(a1), size(a1), shape(a1))


struct Rectangle
	top::Int
	left::Int
	bottom::Int
	right::Int
	# Constructor returns upper-left and lower-right corners
	Rectangle(p::Position, s::Size) = new(p.y + s.height, p.x, p.y, p.x + s.width)
end

# check if rectangles overlap
function overlap(A::Rectangle, B::Rectangle)
	return (A.left < B.right 
					&& A.right > B.left 
					&& A.top > B.bottom 
					&& A.bottom < B.top)
end

function collide(A::Thing, B::Thing)
	println("Checking collision of thing vs. thing")
	rectA = Rectangle(position(A), size(A))
	rectB = Rectangle(position(B), size(B))
	return overlap(rectA, rectB)
end

collide(s1, s2)
collide(a1, a2)
collide(s1, a1)

function collide(A::Spaceship, B::Spaceship)
	println("Checking collision of spaceship vs. spaceship")
	return true # just a test
end

collide(s1, s2)

function collide(A::Asteroid, B::Thing)
	println("Checking collision of asteroid vs. thing")
	return true # test only
end

function collide(A::Thing, B::Asteroid)
	println("Checking collision of thing vs. asteroid")
	return false
end

collide(a1, s1)
collide(s1, a1)

#collide(a1, a2) # ambiguity
