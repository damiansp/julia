z = begin
    x = 1
    y = 2
    x + y
end
println(z)

z = (x = 1; y = 2; x + y)
println(z)
