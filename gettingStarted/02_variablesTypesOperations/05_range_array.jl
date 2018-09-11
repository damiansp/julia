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

println(join(range_arr, ", "))
#println(range_arr[1:3])
#println(range_arr[4:end])
println(a[1:2])
println(a[3:end])

arr = [1, 2, 3, 4, 5]
arr[2:4] = [8, 9, 10]
println(arr)

z5 = zeros(5)
println(z5)

eq_arr = range(0, stop=10, length=5)
println(eq_arr)

fill!(arr, 42)
println(arr)

v1 = rand(Int32, 5)
println(v1)

b = [10, 20, 30]
c = [100, 200, 300]
println(append!(b, c))
println(pop!(b))       # 300
println(b)             # [10, 20, 30, 100, 200]
println(push!(b, 40))  # [10, 20, 30, 100, 200, 40]
println(b)             # [10, 20, 30, 100, 200, 40]
println(popfirst!(b))  # 10
println(b)             # [20, 30, 100, 200, 40]
pushfirst!(b, 10)
println(b)             # [10, 20, 30, 100, 200, 40]

println(sort(b))       # [10, 20, 30, 40, 100, 200]
println(b)             # [10, 20, 30, 100, 200, 40]
sort!(b)
println(b)             # [10, 20, 30, 40, 100, 200]

for elem in b
    println("$elem...")
end

# use .op to apply operator 'op' element-wise
println(b .* 2)

a = [1, 2, 3]
b = [1, 10, 100]
println(a .* b)  # [1, 20, 300]

#println(dot(a, b))

a = [1, 2, 4, 6]
a1 = a # same object
println(a1)
a[4] = 0
println(a1) # [1, 2, 4, 0]

b = [2, 4, 6, 8]
b1 = copy(b) # deepcopy() also exists
b[4] = 0
println(b1)


chars = ['a', 'b', 'c']
println(join(chars))      # abc
println(string(chars))    # ['a', 'b', 'c']
println(string(chars...)) # abc; ... passes contents of array as individ args


