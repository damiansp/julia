println(typeof((a=1, b="hello"))) # NamedTuple{(:a, :b), Tuple{Int64, String}}
println(NamedTuple{(:a, :b), Tuple{Float32, String}}((1, "oh"))) 
println(NamedTuple{(:a, :b)}((1, "ah")))
