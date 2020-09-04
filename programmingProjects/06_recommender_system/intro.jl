using DelimitedFiles
using Distances

DATA = "../data"

movies = readdlm("$(DATA)/top_10_movies.tsv", '\t', skipstart=1)
nemo = ["Finding Nemo (2003)", 0, 1, 1, 0, 1, 0, 0, 0]

distances = Dict{String, Int}()
for i in 1:size(movies, 1)
	distances[movies[i, :][1]] = hamming(Int[movies[i, 2:end]...],
																			 Int[nemo[2:end]...])
end

println("Distances")
println(distances)