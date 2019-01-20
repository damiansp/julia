a = [1, 2, 3]
println(a)

b = Float32[1, 2, 3, 4]
println(b)

c = [1 2 3 4] # a 1x4 matrix (no commas)
println(c)

d = [1 2 3;
     4 5 6;
     7 8 9]
println(d)

for element in d
  println(element)
end

println(zeros(Int, 2))
println(zeros(Float64, 3))
println(ones(Int, 2))
println(ones(Int, 3, 4))
println(trues(2))
println(rand(Int, 4, 2))
println(rand(Char, 3, 3))
println(fill(42, 2, 3))

arr1d = rand(5)
println(arr1d)
println(arr1d[5])

arr2d = rand(5, 2)
println(arr2d)
println(arr2d[4, 1])
