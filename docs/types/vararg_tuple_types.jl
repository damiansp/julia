my_tuple_type = Tuple{AbstractString, Vararg{Int}}

println(isa(("1", ), my_tuple_type)) # true
println(isa(("1", 1), my_tuple_type)) # true
println(isa(("1", 1, 2), my_tuple_type)) # true
println(isa(("1", 1, 2, 3.4), my_tuple_type)) # false
