a, b, c, d = 1, 22., "World", 'x'
t1 = 1, 22., "World", 'x'
t3 = (5, 6, 7, 8)
println(t3[1]) # 5
println(t3[end]) # 8
println(t3[2:3]) # (6, 7)
# t3[3] = 9      # tuples are immutable

for i in t3
    println(i)
end

