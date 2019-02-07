d1 = Dict(1 => 4.2, 2 => 5.3)
d1 = Dict{Int64, Float64}(1 => 4.2, 2 => 5.3)
d2 = Dict{Any, Any}("a" => 1, (2, 3) => true)
d3 = Dict(:A => 100, :B => 200)
d3 = Dict{Symbol, Int64}(:A => 100, :B => 200)
println(d3[:B]) # 200
println(get(d3, :Z, -1)) # -1

louis = [:first_name => "Louis",
         :surname => "Armstrong",
         :occupation => "musician",
         :date_of_birth => "1901-04-08"]
println(haskey(d3, :Z)) # false
println(haskey(d3, :B)) # true
d3[:A] = 150
d3[:C] = 300
prinlnt(length(d3)) # 3

d4 = Dict() # empty, type=Any

d5 = Dict{Float64, Int64}()

delete!(d3, :B)
