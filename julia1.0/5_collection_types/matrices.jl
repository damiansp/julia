using LinearAlgebra

a = [1, 2, 3] # column vector
b = [1 2 3]   # row vector

println(Array{Int64, 1} == Vector{Int64}) # true
println(Array{Int64, 2} == Matrix{Int64}) # true
matrix = [1 2;
          3 4]
println(a == [1; 2; 3]) # true
println(matrix[1, 2])   # 2

a = [1 2]
b = [3;
     4]
println(a * b)  # dotprod (3*1 + 4*2) = 11
println(a .* b) # matmult

rmatrix = rand(3, 5)
println(rmatrix)
println(ndims(rmatrix)) # 2
println(size(rmatrix))  # (3, 5)
nrow = size(rmatrix, 1)
ncol = size(rmatrix, 2)
println(nrow, ", ", ncol) # 3, 5
println(length(rmatrix))  # 15

I3 = Matrix(1. * I, 3, 3)
println(I3)


# copy, deepcopy
x = Array{Any}(undef, 2)
x[1] = ones(2)
x[2] = trues(3)
println(x) # [1.0, 1.0] Bool[t, t, t]

a = x
b = copy(x)
c = deepcopy(x)

x[1] = "Julia"
x[2][1] = false
println(x) # Julia Bool[f t t]
println(a) # Julia Bool[f t t]
println(b) # [1., 1.] Bool[f t t]
println(c) # [1., 1.] Bool[t t t]
println(isequal(c, x)) # false
