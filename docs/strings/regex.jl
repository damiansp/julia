println(occursin(r"^\s*(?:#|$)", "no comment here")) # false
println(occursin(r"^\s*(?:#|$)", "# a comment")) # true

show(match(r"^\s*(?:#|$)", "no comment here")) # nothing
println()
println(match(r"^\s*(?:#|$)", "# a comment here")) # "#"

line = "# a comment"
if match(r"^\s*(?:#|$)", line) === nothing
    println("not a comment")
else
    println("blank or comment")
end


println(match(r"[0-9]", "aaaa1bbbb2cccc3", 1)) # adds start index 1
println(match(r"[0-9]", "aaaa1bbbb2cccc3", 6))

m = match(r"(a|b)(c)?(d)", "acd")
println(m.match)    # acd
println(m.captures) # ["a", "c", "d"]
println(m.offset)   # 1
println(m.offsets)  # [1, 2, 3]

n = match(r"(a|b)(c)?(d)", "ad")
println(n.match)    # ad
println(n.captures) # ["a", nothing, "d"]
println(n.offset)   # 1
println(n.offsets)  # [1, 0, 2]

m = match(r"(?<hour>\d+):(?<minute>\d+)", "12:45")
println(m[:minute]) # 45
println(m[:hour])   # 12
println(m[2])       # 45

println("a", r"." => s"\g<0>1") # a1 : \g<n> labels a numbered group

# Useful flags
# i - case insensitive
# m - treat as multi-line
# s - treat as single line
# x - ignore most whitespace

println(match(r"a+.*c+.*?d$"ism, "Goodby,\nO, angry,\nCruel world\n"))

x = 10
println(r"$x") # r"$x"
println("$x")  # "10"
        
