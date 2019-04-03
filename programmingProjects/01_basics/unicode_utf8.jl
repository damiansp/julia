str = "Søren Kierkegaard was a Danish Philosopher"
println(str[1])  # S
println(str[2])  # ø
#println(str[3]) # StringIndexError
println(str[4])  # r

for s in str
  print(s, " ")
end
println()

n = length(str)
println(n)        # 42
println(str[n])   # e
println(str[end]) # r
println(str[end-10:end]) # Philosopher

