using LinearAlgebra

col_vec = [1, 2, 3]
col_vec2 = [1; 2; 3]
row_vec = [1 2 3]
matrix = [1 2; 3 4]

println(col_vec)
println(col_vec2)
println(row_vec)
println(matrix)

m = rand(3, 5)
println(m)
println(ndims(m)) # 2
println(size(m))  # (3, 5)
nrows = size(m, 1) # 3
ncols = size(m, 2) # 5
println(nrows, ", ", ncols) # 3, 5
nrows, ncols = size(m)
println(nrows, ", ", ncols) # 3, 5
println(length(m))    # 15

i3 = 1 * Diagonal(I, 3)
println(i3)

i3 = [1 0 0; 0 1 0; 0 0 1]
println(i3[:, 2])
println(i3[2, :])
println(i3[2:end, 2:end])

i3[2, :] = [3 3 3]
println(i3)
i3[2:end, 2:end] = [5 7; 9 11]
println(i3)
