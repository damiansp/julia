for i in 1:2:9 # start:by:upto(inclusive)
    println(i)
end

a = split("A, B, C, D", ", ")
println(typeof(a)) # Array{SubString{String},1}
println(a)         # SubString{String}["A", "B", "C", "D"]


