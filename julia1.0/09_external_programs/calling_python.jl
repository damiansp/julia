using PyCall

println(py"10 * 10")

math = pyimport("math")
println(math.sin(math.pi / 2))
