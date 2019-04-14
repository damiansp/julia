include("modules/Letters.jl")

#println(rand_string()) # Error: not defined

#using Letters # Error: Package not found in current path
#using Main.Letters # Same as
using .Letters

println(rand_string())
