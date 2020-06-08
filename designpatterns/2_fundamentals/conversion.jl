# type conversion
println(Float64(1 // 3))
println(convert(Float64, 1 // 3))

x = rand(3) # Float64
x[1] = 1    # 1.0 

mutable struct Foo
	x::Float64
end

foo = Foo(1.)
foo.x = 2 # 2.0

struct Fu
	x::Float64
	Fu(v) = new(v)
end

Fu(1) # 1.0


function foo2()
	local x::Float64
	x = 1
	println(x, " has the type of ", typeof(x))
end

foo2() # 1.0 ... Float64

function fu2()::Float64
	return 1
end

println(fu2()) # 1.0


ccall((:exp, "libc"), Float64, (Float64,), 2)