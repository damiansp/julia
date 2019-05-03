abstract type Mammal end


abstract type Person <: Mammal end


mutable struct Player <: Person
  username::String
  score::Int
end


struct User <: Person
  username::String
  password::String
end


function getusername(p::Person)
  p.username
end


  
sam = User("sam", "password")
println(sam)
println(getusername(sam))
