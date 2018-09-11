# Pkg.add("Dates")

using Base.Libc
using Dates

start = time() # unix epoch time
println(start)
elapsed = time() - start
println("Elapsed time: $elapsed")
println(strftime(time()))

d = Date(1976, 11, 3)
dt = DateTime(1976, 11, 3, 1, 23, 45, 67)
println(d)
println(dt)
println(Dates.year(d))
println(Dates.week(d))
