println("abc" < "xyz") # true
println(findfirst(isequal('x'), "xylophone")) # 1
println(findfirst(isequal('p'), "xylophone")) # 5
show(findfirst(isequal('z'), "xylophone")) # nothing

println(findnext(isequal('o'), "xylophone", 1)) # 4
println(findnext(isequal('o'), "xylophone", 5)) # 7

println(occursin("world", "Hello, world.")) # true
println(repeat(".:Z:. ", 10))

fruits = ["apples", "bananas", "pears"]
println(join(fruits, ", "))
println(join(fruits, ", ", ", and "))

# others
# firstindex(str)
# lastindex(str)
# length(str)
# length(str, i, j)
# ncodeunits(str)
# codeunit(str, i)
println(codeunit("Xylophone", 1)) # 88

# thisind(str, i)
# nextind(str, i, n=1)
# prevind(str, i, n=1)

