tup = ("a", 4, 12.5)
println(tup)

single = (1,)
println(single)

simple = 'e', 2
println(simple)
println(simple[2]) # 2

println((3, 4) .+ (1, 2)) # 4, 6


# named tuples
skills = (language="Julia", version=v"1.0")
println(skills.language)
println(skills[2])
