for i in 1:2:9 # start:by:upto(inclusive)
    println(i)
end

a = split("A, B, C, D", ", ")
println(typeof(a)) # Array{SubString{String},1}
println(a)         # SubString{String}["A", "B", "C", "D"]

arr2 = Array{Int64}(undef, 5)
println(arr2) # [4673744400, 4673744384, 4673744384, 4673744384, 4673744384]

arr3 = Float64[] # 0-elem array
println(arr3)

push!(arr3, 2.2)
println(arr3) # [2.2]

arr4 = collect(1:7)
println(arr4)         # [1, 2, 3, 4, 5, 6, 7]
println(eltype(arr4)) # Int64
println(length(arr4)) # 7
println(ndims(arr4))  # 1

da = [1, 2, 3, 4, 5]
for n in da
    n *= 2
end
println(da) # [1, 2, 3, 4, 5] (iterator is read-only)

for i in 1:length(da)
    da[i] *= 2
end
println(da) # [2, 4, 6, 8, 10]

println(join(arr4, ", ")) # 1, 2, 3, 4, 5, 6, 7
println(arr4[1:3])        # [1, 2, 3]
println(arr4[4:end])      # 4, 5, 6, 7]
da[2:4] = [1, 0, 1]
println(da)               # [2, 1, 0, 1, 10]

println(zeros(3)) # [0.0, 0.0, 0.0]
println(ones(4))  # [1.0, 1.0, 1.0, 1.0]

eqa = range(0, step=10, length=5)
eqb = range(0, step=5, stop=25)
println(eqa) # 0:10:40
println(eqb) # 0:5:25

arr5 = (Array{Any}(undef, 4))
println(arr5) # Any[#undef, #undef, #undef, #undef]
fill!(arr5, 42)
println(arr5) # Any[42, 42, 42, 42]

v = rand(Int32, 5)
println(v) # Int32[1800028188, -1939882508, -1715180972, 327641629, -207258026]
