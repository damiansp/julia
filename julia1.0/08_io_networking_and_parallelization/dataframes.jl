using CSV
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
println(df[2:3, :])
println(df[2:3, 2:3])
println(df[2:3, [:floats, :bools]])

df0 = DataFrame(i=1:10, x=rand(10), y=rand(['a', 'b', 'c'], 10))
println(head(df0))
println(tail(df0))

println(names(df))
println(eltypes(df))
println(describe(df))

data = CSV.read("example.csv", delim=',')
println(typeof(data)) # DataFrame
println(size(data))
println(data)

