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