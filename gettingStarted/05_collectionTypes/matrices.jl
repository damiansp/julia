using LinearAlgebra

col_vec = [1, 2, 3]
col_vec2 = [1;
            2;
            3]
row_vec = [1 2 3]
matrix = [1 2;
          3 4]

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

i3 = [1 0 0;
      0 1 0;
      0 0 1]
println(i3[:, 2])
println(i3[2, :])
println(i3[2:end, 2:end])

i3[2, :] = [3 3 3]
println(i3)
i3[2:end, 2:end] = [5 7;
                    9 11]
println(i3)


#jarr = fill(Array(Int64, 1), 3)
#println(jarr)
#jarr[1] = [1 2]
#jarr[2] = [1 2 3 4]
#jarr[3] = [1 2 3]

ma = [1 2;
      3 4]
println(ma')
println(ma * ma')  # matrix mult
println(ma .* ma') # element-wise mult
println(inv(ma))
println(ma * inv(ma))

v = [1., 2., 3.]
w = [2., 4., 6.]
println(hcat(v, w))
println(vcat(v, w))
println(append!(v, w))

a = [1 2;
     3 4]
b = [5 6;
     7 8]
c = [a b]
println(c)

println(reshape(1:12, 3, 4)) # orders column-wise


# deepcopy() needed to copy arrays and not just references to them
x = [ones(2), trues(3)] #cell(2)
x[1] = ones(2)
x[2] = trues(3)
println(x) # [1 1] [t t t]

a = x
b = copy(x)
c = deepcopy(x)

x[1] = "julia"
x[2][1] = false
println(x) # "julia", [f t t]
println(a) # "julia", [f t t]
println(is(a, x)) # true
println(b)        # [1 1] [f t t]
println(is(b, x)) # false
println(c)        # [1 1] [t t t]
