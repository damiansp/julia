import Base.print # needed to override
using CSV

# 1. Writing to the teminal
write(stdout, "Hello, World!")

struct aCustomType
	x::Int64
	y::Float64
	z::String
end

foo = aCustomType(1, 2, "MyObj")
println(foo)

# custom print
function print(io::IO, c::aCustomType)
	print("$(c.z): x: $(c.x), y: $(c.y)")
end

println(foo)


# 2. Writing to a file
open("testfile.txt", "w") do f
	write(f, "First line\n")
	println(f, "Second line")
end