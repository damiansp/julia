# Space war game


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


moveup!(widget::Widget, v::Int) = widget.position.y -= v
movedown!(widget::Widget, v::Int) = widget.position.y += v
moveleft!(widget::Widget, v::Int) = widget.position.x -=v
moveright!(widget::Widget, v::Int) = widget.position.x += v


Base.show(io::IO, p::Position) = print(io, "($(p.x), $(p.y))")
Base.show(io::IO, s::Size) = print(io, "$(s.width) x $(s.height)")
Base.show(io::IO, w::Widget) = print(
	io, "$(w.name) at $(w.position); size: $(w.size)")


# Test
w = Widget("asteroid", Position(0, 0), Size(10, 20))
moveup!(w, 10)
movedown!(w, 20)
moveleft!(w, 20)
moveright!(w, 10)
println(w)


# Make a bunch of asteroids
function makeasteroids(n::Int, posrange=0:200, sizerange=10:30)
	posrand() = rand(posrange)
	szrand() = rand(sizerange)
	return [
		Widget("Asteroid #$i", 
					 Position(posrand(), posrand()), 
					 Size(szrand(), szrand()))
		for i in 1:n]
end