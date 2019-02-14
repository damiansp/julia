str = read("alice.txt", String)
nonalpha = r"(\W\s?)"
str = replace(str, nonalpha => ' ')
digits = r"(\d+)"
str = replace(str, digits => ' ')
word_list = split(str, ' ')
word_freq = Dict{String, Int64}()
for word in word_list
  word = strip(word)
  if isempty(word) continue end
  haskey(word_freq, word) ? word_freq[word] += 1 : word_freq[word] = 1
end

println("Word:  frequency\n")
words = sort!(collect(keys(word_freq)))
for word in words
  println("$word: $(word_freq[word])")
end
