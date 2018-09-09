for i in 1:2:9
    println(i) # 1, 3, 5, 7, 9
end

a = split("A,B,C,D", ",")
println(typeof(a))
println(a)

arr = [1, 2, 3]
any_arr = Any[2, 4.6, "eight"]
arr2 = Array{Int64}(undef, 5)
println(arr2)

empty_arr = Float64[]
push!(empty_arr, 4.4)
println(empty_arr)

range_arr = [1:7]
println(range_arr)

println(arr[1])
println(arr[end])

println(eltype(arr))
println(length(arr))
println(ndims(arr))

matrix = Array{Int64}(undef, 2, 3)
println(ndims(matrix))
println(size(matrix, 2))
