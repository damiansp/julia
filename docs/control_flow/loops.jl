i = 1
while i <= 5
    println(i)
    global i += 1
end


for i = 1:5
    println(i)
end


for j = 1:5
    println(j)
end


for i in [1, 4, 0]
    println(i)
end


for s ∈ ["foo", "bar", "fubar"]
    println(s)
end


i = 1
while true
    println(i)
    if i >= 5 break end
    global i += 1
end


for j = 1:1000
    if j % 33 == 0 println(j) end
end


for i = 1:10
    i % 3 == 0 || continue # print multiples of 3
    println(i)
end


for i = 1:2, j = 3:4
    println((i, j)) # (1 3) (1 4) (2 3) (2 4)
end


for i = 1:2, j = 3:4
    println((i, j)) # (1 3) (1 4) (2 3) (2 4)
    i = 0 # does nothing
end



