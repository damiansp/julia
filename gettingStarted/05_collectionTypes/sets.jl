s = Set([11, 14, 13, 7, 14, 11])
s2 = Set([3, 5, 7])
println(s)
println(union(s, s2))     # Set([7, 14, 13, 3, 11, 5])
println(intersect(s, s2)) #      7
println(setdiff(s, s2))   #      14, 13, 11
println(issubset(s, s2))  # false

push!(s2, 11)
println(in(11, s2)) # true


tuple_set = Set()
push!(tuple_set, (1, 2))
push!(tuple_set, (2, 4))
println(tuple_set)

