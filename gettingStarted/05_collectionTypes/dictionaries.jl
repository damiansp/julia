d1 = [1 => 4.2, 2 => 5.3, 3 => 3.33] # [typed dict]
#d2 = {"a" => 1, (2, 3) => true} # {dynamic dict}
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
