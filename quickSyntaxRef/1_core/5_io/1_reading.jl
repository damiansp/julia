using CSV
using DataFrames
using HTTP
using JSON2
using XLSX


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


# 1.3 Importing from Excel
if false # don't actually run
  # Get sheet names
  sheetnames = XLSX.sheetnames(XLSX.readxlsx("file.xlsx"))
  # import data from sheet
  m = XLSX.readxlsx("file.xlsx")["sheetname"][:]
  # slice
  m = XLSX.readxlsx("file.xlsx")["sheetname"]["B3:D6"]
  m = XLSX.readdata("file.xlsx", "sheetname", "B3:D6")
  df = DataFrame(XLSX.readtable("file.xlsx", "sheetname"))
end


# 1.4 Importing JSON
jsonstr = """
{
  "species": "Oak",
  "latitude": 53.204199,
  "longitude": -1.072787,
  "trees": [
    {
      "vol": 23.54,
      "id": 1
    }, {
      "vol": 12.25,
      "id": 2
    }
  ]
}"""

struct ForestStand
  sp::String
  lat::Float64
  long::Float64
  trees::Array{Dict{String, Float64}, 1}
end

nottingham = JSON2.read(jsonstr, ForestStand) # ForestStand
nottingham2 = JSON2.read(jsonstr)          # NamedTuple


# 1.5 Accessing Web Resources
HTTP.open("GET", "https://julialang.org/") do io
  while !eof(io)
    println(String(readavailable(io)))
  end
end

res = HTTP.get("http://julialang.org/")
println(String(res.body))

#=
resp = HTTP.request("GET", "https://cohesiondata.ec.eu/resource/2q3n-nr7n.csv")
df = CSV.read(IOBuffer(String(resp.body)))
print(first(df, 3))
=#
