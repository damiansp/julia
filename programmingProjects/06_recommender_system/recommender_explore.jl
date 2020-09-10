using CSV
using DataFrames
using Plots
using Statistics
using StatsPlots


DATA = "../data"
movies = CSV.read("$(DATA)/top_10_movies_user_rankings_clean.csv", DataFrame)

acton_annie = movies[:, 1:3]
println(acton_annie)

acton_annie = acton_annie[
	(acton_annie[:Acton] .> 0) .& (acton_annie[:Annie] .> 0), :]
println(acton_annie)

display(
	plot(acton_annie[:, 2], 
		   acton_annie[:, 3], 
		 	 seriestype=:scatter, 
			 xticks=0:10, 
		 	 yticks=0:10,
		 	 lims=(0, 11),
				label=""))

display(
	scatter(acton_annie[:Acton], 
					acton_annie[:Annie], 
					smooth=true, 
					line=:red, 
					linewidth=2, 
					title="Acton & Annie",
					legend=false,
					lims=(5, 11))
)

print("cor: ")
println(cor(acton_annie[:Acton], acton_annie[:Annie]))