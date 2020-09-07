using CSV
using DataFrames

DATA = "../data"
movies = CSV.read("$(DATA)/top_10_movies_user_rankings.csv", DataFrame)
println(movies)
println(describe(movies))
println(movies[1, 2]) # missing
println(ismissing(movies[1, 2])) # true

for c in names(movies)[2:end]
	movies[ismissing.(movies[c]), c] = 0
end

CSV.write("$(DATA)/top_10_movies_user_rankings_clean.csv", movies)
