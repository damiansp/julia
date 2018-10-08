a = (1, 1+2)
b = (1,)
c = (0., "hello", 6 * 7)

println(a)
println(b)
println(c)
println(c[2])


# Named tuples
x = (a=1, b=2)
println(x)
println(x.b)
