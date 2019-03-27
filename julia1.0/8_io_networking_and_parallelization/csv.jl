using DelimitedFiles


fname = "example.csv"
data = DelimitedFiles.readdlm(fname, ',', header=true)
println(typeof(data))
println()
show(data)
println()
println(data[1])
println(data[2])

body = data[1]
row2 = body[2, :]
println(row2)
col3 = body[:, 3]
println(col3)
