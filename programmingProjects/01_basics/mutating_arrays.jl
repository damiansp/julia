arr = [1, 2, 3]
push!(arr, 4)
println(arr) # 1 2 3 4
push!(arr, 5, 6, 7)
println(arr) # 1 2 3 4 5 6 7

println(pop!(arr)) # 7
println(arr)       # 1 2 3 4 5 6

println(deleteat!(arr, 3)) # 1 2 4 5 6
println(arr)               # 1 2 4 5 6

arr = [1, 2, 3]
arr2 = arr
pop!(arr2)
println(arr) # 1 2

arr = [1, 2, 3]
arr2 = copy(arr)
pop!(arr2)
println(arr) # 1 2 3
