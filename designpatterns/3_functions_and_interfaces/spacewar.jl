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

makeasteroids(5)
makeasteroids(5, 1:10)


function makeasteroids2(n::Int; posrange=0:200, sizerange=10:30) # <- note ";"
	posrand() = rand(posrange)
	szrand() = rand(sizerange)
	return [
		Widget("Asteroid #$i", 
					 Position(posrand(), posrand()), 
					 Size(szrand(), szrand()))
		for i in 1:n]
end
	
asteroids = makeasteroids2(5)
makeasteroids2(5, posrange=10:20) # keyword arg must be named


function makeasteroids3(; n::Int, posrange=0:200, sizerange=10:30) # <- note ";"
	posrand() = rand(posrange)
	szrand() = rand(sizerange)
	return [
		Widget("Asteroid #$i", 
					 Position(posrand(), posrand()), 
					 Size(szrand(), szrand()))
		for i in 1:n]
end



# varargs
# shoot any number of targets
function shoot(from::Widget, targets::Widget...)
	println("Type of targets: ", typeof(targets))
	for target in targets
		println(from.name, " -> ", target.name)
	end
end

spaceship = Widget("Spaceship", Position(0, 0), Size(30, 30))
target1 = asteroids[1]
target2 = asteroids[2]
target3 = asteroids[3]

shoot(spaceship, target1)
shoot(spaceship, target1, target2, target3)
