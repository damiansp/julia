a = 10
b = 150

function break_ex(a, b)
    while a < b
        println(a)
        a += 10
        if a >= 50 break end
    end
end

break_ex(a, b)


arr = rand(1:10, 10)
println(arr)
searched = 4
for (i, current) in enumerate(arr)
    if current == searched
        println("$searched occurs at index $i")
        break
    end
end


for n in 1:10
    if 3 <= n <= 6 continue end
    println(n)
end

