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


# Returning "multiple" values
function mas_y_menos(x, y)
  x + y, x - y
end

a, b = mas_y_menos(10, 5)
println(a) # 15
println(b) # 5

function more_n_less(x=100, y=10)
  x + y, x - y
end

println(more_n_less()) # 110, 90


# Keyword args
#function thermal_confort(
#        temperature, humidity; scale=:celsius, age=35, health_risk=age / 100))
#  ...
#end

# Invoke
#thermal_confort(27, 56, age=72, scale=:fahrenheit)

