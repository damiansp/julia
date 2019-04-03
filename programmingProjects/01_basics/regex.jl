reg = r"[0-9]+"
println(match(reg, "It was 1976")) # RegexMatch("1976")
println(typeof(reg))               # Regex
println(Regex("[0-9]+"))           # r"[0-9]+"
println(Regex("[0-9]+") == reg)    # true

show(match(r"it was", "It was 1976"))     # nothing
println()
println(match(r"it was"i, "It was 1976")) # RegexMatch("It was")

println(occursin(r"hello", "It was 1976")) # false
println(occursin(r"19", "It was 1976"))    # true

alice = (
  "Why, sometimes I've believed as many as 6 impossible things before breakfast"
)
m = match(r"(\w+)+", alice)
println(m) # RegexMatch("Why", 1="Why")

m = match(r"(\w+)+", alice, 6)
println(m) # RegexMatch "sometimes", 1="sometimes")

m = match(r"((\w+)(\s+|\W+))", alice)
println(m)          # RegexMatch("Why, ", 1="Why, ", 2="Why", 3=", ")
println(m.match)    # "Why, "
println(m.captures) # "Why, ", "Why", ", "
println(m.offsets)  # 1, 1, 4

# For greedy matching (instead of first match)
for m in eachmatch(r"((\w+)(\s+|\W+))", alice)
    println(m)
end

# or
println(collect(eachmatch(r"((\w+)(\s+|\W+))", alice)))
