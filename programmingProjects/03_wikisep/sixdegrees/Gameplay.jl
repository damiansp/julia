module Gameplay

using ..Wikipedia # ? not just Wikipedia?

export newgame


const DIFFICULTY_EASY = 2
const DIFFICULTY_MEDIUM = 4
const DIFFICULTY_HARD = 6


function newgame(difficulty=DIFFICULTY_HARD)
  articles = []
  for i in 1:difficulty + 1
    article = if i == 1
      fetchrandom()
    else
      rand(articles[i - 1][:links]) |> Wikipedia.fetchpage
    end
    articledata = Dict(:content => article, :links => articlelinks(article))
    push!(articles, articleinfo(article))
  end
  articles
end



end
