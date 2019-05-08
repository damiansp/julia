mutable struct Player
  username::String
  score::Int
end


mutable struct Customer
  name::String
  total_purchase_value::Float64
  credit_score::Float64
end


function getscore(p::Player)
  p.score
end


function getscore(c::Customer)
  c.credit_score
end


function getscore(t::Union{Player, Customer})
  isa(t, Player) ? t.score : t.credit_score
end


function getscore(s)
  if in(:score, fieldnames(typeof(s)))
    s.score
  elseif in(:credit_score, fieldnames(typeof(s)))
    s.credit_score
  else
    error("$(typeof(s)) does not have a score property")
  end
end

me = Player("Damian", 10)
print(getscore(me))
#@which getscore(me)

sam = Customer("Sam", 72.95, 100)
print(getscore(sam))
#which getscore(sam)

print(methods(getscore))
