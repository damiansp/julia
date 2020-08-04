println(Expr(:call, :+, :x, :y))
println(Expr(:call, :sin, Expr(:call, :+, :x, :y)))

# Simpler form
ex = :(x + y)
println(ex)
dump(ex)

ex = quote
  x = 1
  y = 2
end
println(ex)

