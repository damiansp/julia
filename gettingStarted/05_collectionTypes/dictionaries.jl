d1 = [1 => 4.2, 2 => 5.3, 3 => 3.33] # [typed dict]
d2 = Dict{Any, Any}("a" => 1, (2, 3) => true) # {dynamic dict}
#d3 = [:A => 100, :B => 200]

println(d1[1])
#println(d2["a"])
#println(d3[:B])
println(get(d1, 2, -1))
println(get(d1, 9, -1))
println((1 => 4.2) in d1) # true
println(1 in d1)          # false
println(1 in keys(d1))    # true
#println(haskey(d1, 1))

d4 = Dict()
d5 = Dict{Float64, Int64}


for k in keys(d1)
  println(k, ": ", d1[k])
end

for v in values(d1)
  println(v)
end


keys1 = ["J.S. Bach", "Woody Allen", "Barack Obama"]
values1 = [1685, 1935, 1961]
d6 = Dict(zip(keys1, values1))
d6 = ["J.S. Bach" => 1685, "Woody Allen" => 1935, "Barack Obama" => 1961]
println(d6)
for (k, v) in d6
    println("$k was born in $v")
end

for p in d6
    println("$(p[1]) was born in $(p[2])")
end

dpairs = ["a", 1, "b", 2, "c", 3]
d7 = [dpairs[i] => dpairs[i + 1] for i in 1:2:length(dpairs)]
println(d7)

#d7 = Dict{String, Int64}(
#    [pairs[i] => dpairs[i + 1] for i in 1:2:length(dpairs)])
#println(d7) # Nope

#function show_factors(n)
#    d = Primes.factor(n)
#    println("factors for $n")
#    for (k, v) in d
#        print("$k^$v\t")
#    end
#end

#@time show_factors(3752)


# Copy keys into an array
key_array = [k for (k, v) in d7]
val_array = [v for (k, v) in d7]
println(key_array)
println(val_array)
