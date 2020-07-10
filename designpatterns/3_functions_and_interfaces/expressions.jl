println(Expr(:call, :+, :x, :y))
println(Expr(:call, :sin, Expr(:call, :+, :x, :y)))

# Simpler form
ex = :(x + y)
println(ex)
dump(ex)

