using CSV
using DataFrames

DATA = "../data"
movies = CSV.read("$(DATA)/top_10_movies_user_rankings.csv", DataFrame)
println(movies)
