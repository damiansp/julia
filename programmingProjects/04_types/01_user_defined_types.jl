struct Article
  content::String
  links::Vector{String}
  title::String
  image::String
end


julia_article = Article("Julia is a high-level dynamic progrmming language",
                        ["/wiki/Jeff_Bezanson",
                         "/wiki/Stefan_Karpinski",
                         "/wiki/Viral_B._Shah",
                         "/wiki/Alan_Edalman"],
                        "Julia (programming language)",
                        "/220px-Julia_prog_langauge.svg.png")
println(julia_article.title)

# struct is immutable by default
#julia_article.title = "A cool new langauge" # Error

push!(julia_article.links, "/wiki/Multiple_dispatch")
println(julia_article.links)
                         


mutable struct Player
  username::String
  score::Int
end


me = Player("damian", 0)
me.score += 10
println(me)


