# A macro is a function with expression(s) as both input and output
macro hello()
	return :(for i in 1:3 println("hello world") end)
end

@hello() # or simply
@hello


macro hi(n)
	return :(for i in 1:$n println("hi there!") end)
end

@hi(5)
@hi 5

a = 1
b = "hello"
c = :hey

function showme(x)
	@show x
end

showme(a) # x = 1
showme(b) # x = "hello"
showme(c) # x = :hey

macro showit(x)
	@show x
end

@showit a # x = :a
@showit b # x = :b
@showit c # x = :c
