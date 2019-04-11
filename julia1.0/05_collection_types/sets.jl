s = Set([11, 14, 13, 7, 14, 11])
println(s) # [7, 14, 13, 11]

s1 = Set([11, 25])
s2 = Set([25, 3.14])

println(union(s1, s2)) # 11, 25, 3.14
println(intersect(s1, s2)) # 25
println(setdiff(s1, s))    # 11
println(issubset(s1, s2))  # false

push!(s1, 32)
println(s1)
println(in(32, s1))
