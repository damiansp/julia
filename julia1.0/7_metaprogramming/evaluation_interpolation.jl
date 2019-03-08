e1 = Expr(:call, *, 3, 4)
println(e1) # (*)(3, 4)
println(e1 == :((*)(3, 4))) # false
println(e1 == (*)(3, 4))    # false

e2 = Expr(:call, *, 3, :a)
#println(eval(e2)) # Error: a not defined
a = 4
println(eval(e2)) # 12

b = 1
e4 = :(a + b) # :(a + b)
e5 = :($a + b) # :(4 + b)
