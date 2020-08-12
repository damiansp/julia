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


# Splatting
function triangularformation!(s1::Widget, s2::Widget, s3::Widget)
	xoffset = 30
	yoffset = 50
	s2.position.x = s1.position.x - xoffset
	s3.position.x = s1.position.x + xoffset
	s2.position.y = s3.position.y = s1.position.y - yoffset
	(s1, s2, s3)
end

spaceships = [Widget("Spaceship $i", Position(0, 0), Size(20, 50)) for i in 1:3]
triangularformation!(spaceships...)

function randommove()
	rand([moveup!, movedown!, moveleft!, moveright!])
end

function randomleap!(w::Widget, movefunc::Function, distance::Int)
	movefunc(w, distance)
	w
end

randomleap!(spaceship, randommove(), rand(50:100))
randomleap!(spaceship, randommove(), rand(50:100))


# Anonymous funcs
function explode(x)
	println(x, " is explode")
end

function cleanup_galaxy(asteroids)
	foreach(exlode, asteroids)
end

#cleanup_galaxy(asteroids)

function cleanup_galaxy2(asteroids)
	foreach(x -> println(x, " is explode!"), asteroids)
end

cleanup_galaxy2(asteroids[1:2])

function cleanup_galaxy3(asteroids, spaceships)
	ep = x -> println(x, " is EXPLODE!!")
	foreach(ep, asteroids)
	foreach(ep, spaceships)
end

cleanup_galaxy3(asteroids[3:end], spaceships)


# Do-syntax
healthy(spaceship) = rand(Bool)

# Make sure ship is healthy before any operation
function fire(f::Function, spaceship::Widget)
	if healthy(spaceship)
		f(spaceship)
	else
		println("Operation aborted: unhealthy ship")
	end
	nothing
end

for i in 1:5
	fire(s -> println(s, " launched missile!"), spaceship)
end

for i in 1:5
	fire(s -> begin
		moveup!(s, 100)
		println(s, "launched missle and retreated!")
		movedown!(s, 100)
	end,
	spaceship)
end

# cleaner: do-block defines an anonymous function passed in as the first arg of 
# fire()
for i in 1:5
	fire(spaceship) do s
		moveup!(s, 100)
		println(s, " blitzkreiged yo ass!")
		movedown!(s, 100)
	end
end

function processfile(func::Function, filename::AbstractString)
	ios = nothing
	try
		ios = open(filename)
		func(ios)
	finally
		close(ios)
	end
end

processfile("/Users/dsp/.bashrc") do ios
	lines = readlines(ios)
	println(length(lines))
end