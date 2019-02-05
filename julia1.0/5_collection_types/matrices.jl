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

println(I3[:,  2])
println(I3[2, :])
println(I3[2:end, 2:end]) # cannot use [2:, 2:] as in python


a = [1 2;
     3 4]
println(a[:])

jagged = (Array{Int64, 1})[]
push!(jagged, [1, 2])
push!(jagged, [1, 2, 3, 4])
push!(jagged, [1, 2, 3])
println(jagged)

m = [1 2;
     3 4]
println(m)
println(m') # transpose
println(transpose(m'))

println(m * m')  # matrix multiply
println(m .* m') # elem-wise
println(inv(m)) # inverse
println(m * inv(m))

u = [1, 2, 3]
v = [2, 4, 6]
println(hcat(u, v))
println(vcat(u, v)) # same as
println(append!(u, v))

a = [1 2;
     3 4]
b = [5 6;
     7 8]
c = [a b]
println(c)
d = [a;
     b]
println(d)
println(reshape(1:12, 3, 4))

a = rand(3, 3)
println(reshape(a, (9, 1)))

        

        
     
     
