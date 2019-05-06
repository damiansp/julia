module Gameplay

using ..Wikipedia, ..Wikipedia.Articles

export newgame


const DIFFICULTY_EASY = 2
const DIFFICULTY_MEDIUM = 4
const DIFFICULTY_HARD = 6


function newgame(difficulty=DIFFICULTY_HARD)
  articles = Article[]
  for i in 1:difficulty + 1
    article = if i == 1
      fetchrandom()
    else
      rand(articles[i - 1].links) |> fetchpage
    end
    push!(articles, articleinfo(article))
  end
  articles
end



end
