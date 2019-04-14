push!(LOAD_PATH, "modules")

using Letters

println(rand_string())
println(Letters.MY_NAME) # not exported so Letters requires

println(names(Letters, all=true))


using Letters: MY_NAME
println(MY_NAME) # Letters. not necessary now


import Numbers
println(names(Numbers))

#half_rand() # Error: not defined

#import Numbers.half_rand, Numbers.MY_NAME # same as
import Numbers: half_rand, MY_NAME

println(half_rand())
