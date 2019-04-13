push!(LOAD_PATH, "modules")

using Letters

println(rand_string())
println(Letters.MY_NAME) # not exported so Letters requires
