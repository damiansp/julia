using DataFrames
using Missings

df = DataFrame()
df[:nums] = 1:4
df[:floats] = [exp(1), pi, sqrt(2), 42]
df[:bools] = [true, false, true, true]
println(df)

# OR
df = DataFrame(
  nums=1:4, floats=[exp(1), pi, sqrt(2), 42], bools=[true, false, true, true])
println(df)

println(df[2]) # 2nd col; same as
println(df[:floats])

println(df[1, :]) # 1st row

