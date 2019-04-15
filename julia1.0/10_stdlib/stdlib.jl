println(filter(x -> iseven(x), 1:10))
println(mapreduce(x -> sqrt(x), +, 1:10)) # sqrt(1) + sqrt(2) + ... + sqrt(10)
println(sum(map(x -> sqrt(x), 1:10)))     # same


