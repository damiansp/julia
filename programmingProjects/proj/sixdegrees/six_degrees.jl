using Pkg
pkg"activate ."

include("Wikipedia.jl")
include("Gameplay.jl")
using .Gameplay
using .Wikipedia

articles = newgame(Gameplay.DIFFICULTY_HARD)

for article in articles
  println(article.title)
end
