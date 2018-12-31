using LinearAlgebra

b = collect(1:7)
c = [80, 900, 1000]
append!(b, c)
println(b)       # [1, 2, 3, 4, 5, 6, 7, 80, 900, 1000]
println(pop!(b)) # 1000
println(b)       # [1, 2, 3, 4, 5, 6, 7, 80, 900]
push!(b, 10000)  
println(b)       # [1, 2, 3, 4, 5, 6, 7, 80, 900, 10000]
println(popfirst!(b)) # 1
println(b)            # [2, 3, 4, 5, 6, 7, 80, 900, 10000]
println(splice!(b, 8)) # 900
println(b)             # [2, 3, 4, 5, 6, 7, 80, 10000]
println(in(7, b))      # true
d = [1, 2, 4, 9, 19, 38, 13, 6, 3, 1]
println(sort(d)) # [1, 1, 2, 3, 4, 6, 9, 13, 19, 38]
println(d)       # [1, 2, 4, 9, 19, 38, 13, 6, 3, 1]
sort!(d)
println(d)       # [1, 1, 2, 3, 4, 6, 9, 13, 19, 38]

for i in d
    print("$i ")
end

e = [1, 2, 3]
f = [1, 2, 4]
println(e .+ 2) # [3, 4, 5]
println(e * 2)  # [2, 4, 6]
println(e .* f) # [1, 4, 12]

println(sum(e .* f))             # 17 same as:
println(LinearAlgebra.dot(e, f)) # 17

a = [1, 2, 4, 6]
a_copy = a
println(a_copy) # [1, 2, 4, 6]
a[4] = 8
println(a_copy) # [1, 2, 4, 8]

function change_array(a)
    a[2] = 42
end

change_array(a)
println(a_copy) # [1, 42, 4, 8]

println(string(a))    # [1, 42, 4, 8]
println(join(a))      # 14248
println(string(a...)) # 14248

