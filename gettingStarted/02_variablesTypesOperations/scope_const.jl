# arbitrary blocks defined with begin...end:
x = begin
    a = 5
    2 * a
end

println(x) # 10
println(a) # 5

const G 6.67e-11
