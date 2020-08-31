using OffsetArrays

y = OffsetArray(rand(3), 0:2)
println(y[0:2])
