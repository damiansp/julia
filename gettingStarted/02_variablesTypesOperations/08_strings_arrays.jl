using Statistics

str = "The Gold and Blue Loses a Bit of Its Luster"
println(str)
n_chars = length(str)
println("str has $n_chars characters")
str2 = replace(str, "Blue" => "Red")
println(str)
println(str2)
subs = str[25:30]
print("-$(lowercase(subs))-")
println("\n
All the chars:")
for c in str
    println(c)
end
arr = split(str, ' ')
show(arr)
n_words = length(arr)
println("str has $n_words words")
println("They are:")
for word in arr
    println(word)
end
arr[4] = "Purple"
show(arr)
println("Convert back to a sentence:")
n_str = join(arr, ' ')
println(n_str)

println("arrays: calculate sum, mean, sd")
arr = 1:100
println(typeof(arr))
println(sum(arr))
println(mean(arr))
println(std(arr))
