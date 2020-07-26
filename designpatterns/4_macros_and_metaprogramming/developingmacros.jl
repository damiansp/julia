# A macro is a function with expression(s) as both input and output
macro hello()
	return :(for i in 1:3 println("hello world") end)
end

@hello() # or simplyt
@hello
