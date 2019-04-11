println(@isdefined a) # false


mutable struct Person
  name::String
  height::Float64
end

println(fieldnames(Person)) # (:name, :height)
println(Person.types)       # (String, float)

println(code_lowered(+, (Int, Int)))
println(code_typed(+, (Int, Int)))
