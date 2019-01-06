reg = r"[0-9]+"
println(match(reg, "It was 1976")) # RegexMatch("1976")
println(typeof(reg))               # Regex
println(Regex("[0-9]+"))           # r"[0-9]+"
println(Regex("[0-9]+") == reg)    # true

show(match(r"it was", "It was 1976"))     # nothing
println()
println(match(r"it was"i, "It was 1976")) # RegexMatch("It was")

