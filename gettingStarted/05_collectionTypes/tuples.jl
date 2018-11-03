a, b, c, d, e = 1, 22.0, "World", 'x', false
t1 = (1, 22.0, "World", 'x', false)
println(typeof(t1)) # Tuple{Int64, Float64, String, Char, Bool}

t3 = (5, 6, 7, 8)
println(t3[1])      # 5
println(t3[end])    # 8
println(t3[2:3])    # (6, 7)
# t3[3] = 9 # Error

for i in t3
  println(i)
end

a, b = t3
println(a) # 5
println(b) # 6


