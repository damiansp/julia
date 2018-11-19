mutable struct Bar
    baz
    qux::Float64
end

bar = Bar("Heya", 1.5)
println(bar.qux) # 1.5
bar.qux = 2.
bar.baz = 1/2
println(bar.qux) # 2.0
