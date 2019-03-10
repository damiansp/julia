d = Dict()
setindex!(d, "World", "Hello")
d["Hola"] = "Mundo"
d[:speed] = 6.4
println(d)
d["Hello"] = "Earth" # overwrite

dt = Dict("age" => 12)
println(dt)
