#(1 + 2)::AbstractFloat # TypeError
(1 + 2)::Int

function foo()
    x::Int8 = 100
    x
end

println(foo())
println(typeof(foo()))

function sinc(x)::Float64
    if x == 0 return 1 end
    return sin(pi*x) / (pi*x)
end


