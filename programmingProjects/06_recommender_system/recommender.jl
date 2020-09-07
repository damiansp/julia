using CSV
using DataFrames

DATA = "../data"
movies = CSV.read("$(DATA)/top_10_movies_user_rankings_clean.csv", DataFrame)

acton_annie = movies[:, 1:3]
println(acton_annie)

acton_annie = acton_annie[
	(acton_annie[:Acton] .> 0) .& (acton_annie[:Annie] .> 0), :]
println(acton_annie)
