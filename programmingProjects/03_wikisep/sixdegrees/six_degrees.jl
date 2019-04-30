using Pkg
pkg"activate ."

include("Wikipedia.jl")
include("Gameplay.jl")
using .Gameplay
using .Wikipedia


for article in newgame(Gameplay.DIFFICULTY_HARD)
  println(article[:title])
end
