people = ["Alison", "Bob", "Chuck"]

for person in people
  println("Hello $person")
end

for i in eachindex(people)
  println("$i: $(people[i])")
end



