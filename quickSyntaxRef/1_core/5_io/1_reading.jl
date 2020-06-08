using CSV

# 1. Reading (Input)

# 1.1 Reading from the Terminal
println("Enter a string: ")
aString = readline()
println("Entered: " * aString)
println("Enter an int: ")
anInt = parse(Int64, readline())
println("Entered: " * "$(1 * anInt)")

function getUserInput(T=String, msg="")
  print(msg)
  if T == String
    return readline()
  else
    try
      return parse(T, readline())
    catch
      println("Could not parse. Try again: ")
      getUserInput(T, msg)
    end
  end
end

sentence = getUserInput(String, "Sentence to be repeated: ")
n = getUserInput(Int64, "Times to repeat: ")
[println(sentence) for i in 1:n]
println("Done!")



# 1.2 Reading from a File
# Full text
open("./test.txt", "r") do f
  content = read(f, String)
  print(content)
end


# Line by line
open("test.txt", "r") do f
  for (i, ln) in enumerate(eachline(f))
   println("$i: $ln")
  end
end


# CSVs
data = CSV.read("test.csv", missingstring="NA") # delim=','
print(data)