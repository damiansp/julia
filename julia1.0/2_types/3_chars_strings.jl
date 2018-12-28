println(typeof('a')) # Char
println(Int('A'))    # 65
println(Char(68))    # D
println(isvalid(Char, 0x3b1)) # true
println(Char(0x3b1))          # α

s = "this is a string"
sub = s[11:end]
println(sub) # string
println('A' == "A") # false

a = 2
b = 3
println("\$$a * $b = \$$(a * b)")

s2 = s * ", too!"
println(s2) # this is a string, too!

color = :"#DA139A" # symbol--use if const to save memory
println(color)

println(replace(s2, "string" => "drink"))
appendage = split(s2, ", ")[2]
println(appendage) # too!
