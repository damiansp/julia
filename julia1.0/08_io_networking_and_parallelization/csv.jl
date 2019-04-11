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

z = [body[:, 1] body[:, 3]] # includes headers
println(z)
z = [body[2:end, 1] body[2:end, 3]] # exclude headers
println(z)

struct People
  name::Array{String}
  birthdate::Array{String}
  sex::Array{Char}
  state::Array{String}
end

#person1 = People(body[1, :]...)
#println(person1)
