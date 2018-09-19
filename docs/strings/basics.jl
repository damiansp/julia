# String basics
str = """Hello, "world".\n"""
println(str[1])
println(str[6])
println(str[end])
println(str[end - 1])
#println(str[end / 2])
println(str[4:10])
println(typeof(str[4]))   # Char
println(typeof(str[4:4])) # String

substr = SubString(str, 1, 4)
println(substr)         # Hell
println(typeof(substr)) # Substring{String}

# Unicode, utf-8
s = "\u2200 x \u2203 y"
println(s)
println(s[1])
#println(s[2]) # StringIndexError
println(s[1:4])

for i = firstindex(s):lastindex(s)
    try
        println(s[i])
    catch
        # ignore index error
    end
end

for c in s
    println(c)
end


