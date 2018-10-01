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
