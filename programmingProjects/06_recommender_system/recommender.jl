using CSV
using DataFrames
using Statistics


const DATA = "../data"
const movies = CSV.read("$(DATA)/top_10_movies_user_rankings_clean.csv", 
												DataFrame)
const MIN_SIM = 0.8
const MIN_RATING = 0.7


function get_user_similarity(targetuser)
	similarity = Dict{Symbol, Float64}()
	for user in names(movies)[2:end]
		user == targetuser && continue
		ratings = movies[:, [user, targetuser]]
		common_movies = ratings[
			(ratings[user] .> 0) .& (ratings[targetuser] .> 0), :]
		corr = try
			cor(common_movies[user], common_movies[targetuser])
		catch
			0.
		end
		similarity[Symbol(user)] = corr
	end
	similarity
end


function recommend(targetuser)
	recommended = Dict{String, Float64}()
	for (user, similarity) in get_user_similarity(targetuser)
		similarity > MIN_SIM || continue
		ratings = movies[:, [Symbol("Movie title"), user, targetuser]]
		recommendations = ratings[
			(ratings[user] .> MIN_RATING) .& (ratings[targetuser] .==0), :]
		for movie in eachrow(recommendations)
			recommended[movie[Symbol("Movie title")]] = movie[user] * similarity
		end
	end
	recommended
end


for user in names(movies)[2:end]
	println("Recommendations for $user: $(recommend(user))")
end


