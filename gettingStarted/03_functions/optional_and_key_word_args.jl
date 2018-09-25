f(a, b=5) = a + b

# println(f(2, b=7)) # ERROR: f does not accept keyword args


k(x; a1=1, a2=2) = x*(a1 + a2)
println(k(3, a2=2, a1=1)) # 9


