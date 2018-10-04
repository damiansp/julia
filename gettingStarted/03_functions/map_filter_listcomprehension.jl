println(map(x -> 10x, [1, 2, 3, 4, 5]))
cubes = map(x -> x^3, 1:5)
println(cubes)

println(map(*, [1, 2, 3], [4, 5, 6])) # element-wise application of '*'

r1 = map(
  x -> begin
    if x == 0 return 0
    elseif iseven(x) return 2
    else return 1
    end
  end,
  -3:3)
println(r1)

# alternately:
r2 = map(-3:3) do x
    if x == 0 return 0
    elseif iseven(x) return 2
    else return 1
    end
end
println(r2)


println(filter(n -> iseven(n), 1:10)) # [2, 4, 6, 8, 10]


# list comprehensions
arr = Float64[x^2 for x in 1:4]
println(arr) # [1., 4., 9., 16.]
cubes = [x^3 for x in 1:5]
mat1 = [x + y for x in 1:2, y in 1:3]
println(mat1) # [2 3 4; 3 4 5]
table10 = [x * y for x=1:10, y=1:10]
println(table10) # 10 x 10 mult table
arrany = Any[i * 2 for i in 1:5]
println(arrany) # Any[2, 4, 6, 8, 10]


