str = read("words1.txt", String)
nonalpha = r"(\W\s?)"
digits = r"(\d+)"
str = replace(str, nonalpha => ' ')
str = replace(str, digits => ' ')
word_list = split(str, ' ')
word_freq = Dict{String, Int64}()
for word in word_list
    word = strip(word)
    if isempty(word) continue end
    haskey(word_freq, word) ? word_freq[word] += 1 : word_freq[word] = 1
end

words = sort!(collect(keys(word_freq)))
println("Word: frequency")
for word in words
    println("$word: $(word_freq[word])")
end
