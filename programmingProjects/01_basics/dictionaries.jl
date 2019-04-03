using Dates


d = Dict()
setindex!(d, "World", "Hello")
d["Hola"] = "Mundo"
d[:speed] = 6.4
println(d)
d["Hello"] = "Earth" # overwrite

dt = Dict("age" => 12)
println(dt)

dx = Dict(1 => 11)
dx[2.0] = 12
println(dx)
# dx[2.4] = 12 # InexactError

clients_purchases = Dict("John Roche" => ["soap", "wine", "apples", "bread"],
                         "Merry Lou" => ["water", "apples", "cereal", "milk"])
dd = Dict{String, Int}("" => 2.0)
println(dd)

p1 = "a" => 1
p2 = Pair("b", 2)
println(Dict(p1, p2))
println(Dict([p1, p2]))

println(Dict([x => Dates.dayname(x) for x = (1:7)]))

d = Dict(:foo => 1, :bar => 2)
println(d[:bar]) # 2
#println(d[:fu])  # KeyError
println(haskey(d, :fu)) # false
println(get(d, :fu, 0))  # 0

get!(d, :fu, 100)
print(d) # ...:fu => 100
println(haskey(d, :fu)) # true

delete!(d, :fu)
println(keys(d)) # :bar, :foo (KeySet)
println(values(d)) # 2, 1
println(collect(keys(d))) # array

d2 = Dict(:fu => 3)
d3 = merge(d, d2) # last collection overwrites previous if same key
println(merge(d3, Dict(:fu => 10))) # :fu => 10
