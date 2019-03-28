function add(x, y)
    x + y
end

add2(x, y) = x + y

println(add(1, 2))
println(add2(2, 3))


function fake_add(x, y)
    return "All done"
    x + y # unreachable
end

println(fake_add(3, 5))
