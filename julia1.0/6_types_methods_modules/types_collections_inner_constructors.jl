mutable struct Person
  first_name::String
  last_name::String
  sex::Char
  age::Float64
  children::Array{String, 1}
end

p1 = Person("Alan", "Bates", 'M', 45.5, ["Jeff", "Stephen"])
people = Person[]
push!(people, p1)
push!(people, Person("Julia", "Smith", 'F', 27, ["Viral"]))
show(people)

#full_name(p::Person) = "$(p.first_name) $(p.last_name)"
full_name(p::Person) = string(p.first_name, " ", p.last_name)


mutable struct Family
  name::String
  members::Array{String, 1}
  big::Bool
  Family(name::String) = new(name, String[], false)
  Family(name::String, members) = new(name, members, length(members) > 4)
end

fam = Family("Bates-Smith", ["Alan", "Julia", "Stephen", "Jeff", "Viral"])
show(fam)
