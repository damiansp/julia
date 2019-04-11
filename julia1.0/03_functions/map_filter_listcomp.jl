println(map(x -> 10x, [1, 2, 3]))
cubes = map(x -> Base.power_by_squaring(x, 3), collect(1: 5))
println(cubes)
println(map(*, [1, 2, 3], [4, 5, 6])) # 4, 10, 18

map(x ->
    begin
      if x == 0 return 0
      elseif iseven(x) return 2
      elseif isodd(x) return 1
      end
    end, collect(-3:3))

# equivalent:
map(collect(-3:3)) do x
    if x == 0 return 0
    elseif iseven(x) return 2
    elseif isodd(x) return 1
    end
end

println(filter(n -> iseven(n), collect(1:10)))

arr = Float64[x^2 for x in 1:4]
println(arr)

cubes = [x^3 for x in 1:5]
println(cubes)

mat1 = [x + y for x in 1:2, y in 1:3]
println(mat1)

kuku = [x*y for x=1:10, y=1:10]
println(kuku)

arrany = Any[2i for i in 1:5]
println(arrany)

