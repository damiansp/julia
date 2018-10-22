x = 9
println("This is global x: $x")

function funscope(n)
    x = 0 # x in local scope of func
    for i = 1:n
        local x # x local to for loop
        x = i + 1
        if (x == 7) println("This is the local x in for: $x") end
    end
    println("This is the local x in funscope: $x")
    global x = 15
    x
end

funscope(10)
println("This is global x: $x")
