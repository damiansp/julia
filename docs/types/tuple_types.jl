struct Tuple2{A, B}
    a::A
    b::B
end

println(typeof((1, "foo", 2.5))) # Tuple{Int64, String, Float64}
println(Tuple{Int, AbstractString} <: Tuple{Real, Any}) # true
println(Tuple{Int, AbstractString} <: Tuple{Real, Real}) # false
println(Tuple{Int, AbstractString} <: Tuple{Real, })      # false

