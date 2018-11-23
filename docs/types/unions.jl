IntOrString = Union{Int, AbstractString}
println(1::IntOrString)
println("Hello!"::IntOrString)
#println(1.0::IntOrString) # TypeError


