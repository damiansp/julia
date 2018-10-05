println([1 2 3 4])
println(hcat(1, 2, 3, 4))
println([1; 2; 3; 4])
println(vcat(1, 2, 3, 4))
println([1 2; 3 4])
# println(hvcat(1, 2; 3, 4))
A = 1:5
B = [1 2 3 4 5]
println(A)
println(A')
println(B)
println(B')
println(adjoint(B))

println(A[3])
println(getindex(A, 3))

A[3] = 6
println(A)


