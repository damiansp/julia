r = 1:20
abc = 'a':'z'
println(abc[10]) # j
println(abc[end]) # z
println(r)    # 1:20
println(r...) # 123456....
println((r...,)) # (1, 2, 3, 4, ...)
a = [1:20...]
println(a) # [1, 2, 3, 4, ...]
by_fives = (0:5:20)
println((by_fives...,)) # (5, 10, 15, 20)
half_steps = collect(0.5:0.5:5)
println(half_steps) # [0.5, 1, 1.5, 2, ...]

