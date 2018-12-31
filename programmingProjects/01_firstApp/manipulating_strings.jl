str = "this is a string"
println(str[1])
println(str[9:11])
println(str[1], " ", str[1:1])
println(str[1] == str[1:1]) # false
println(typeof(str[1]), " ", typeof(str[1:1])) # Char String

