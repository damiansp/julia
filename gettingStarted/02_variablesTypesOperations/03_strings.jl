using Printf

println("typeof(\"hello\")", typeof("hello"))
println("typeof(\"Güdrun\")", typeof("Güdrun"))

# Strings are immutable:
s = "Hello, Julia"
#s[8] = "B" # ERROR
# Indexing starts at 1
println("s[1] = ", s[1])
println("s[end] = ", s[end])
println("endof(s) = ", lastindex(s))
println("length(s) = ", length(s))

for c in s
    println(c)
end

println("s[8:10] = ", s[8:10])
println("'A' == \"A\": ", 'A' == "A")

# String interpolation uses $var and $(expr)
a = 2
b = 3
println("$a * $b = $(a * b)")
println("\$$a * \$$b = \$$(a * b)")

# String concatenation with * (why??)
println("\"ABC\" * \"DEF\" = ", "ABC" * "DEF")
println("string(\"ab\", \"cd\", \"ef\"): ", string("ab", "cd", "ef"))

# Find index of char in string:
println("'l' occurs in 'Julia' at index: ", findfirst("l", "Julia"))
println("replace(\"Julia\", \"u\", \"i\"): ", replace("Julia", "u" => "i"))
a1 = "this,is,a,list"
a2 = "this, is, another, list"
a3 = "the last list"
println(split(a1, ','))
println(split(a3))

name = "Jules"
@printf("Hello, %s\n", name)

pi = 3.14159
pi_str = @sprintf("%0.3f", pi)
println(pi_str)
