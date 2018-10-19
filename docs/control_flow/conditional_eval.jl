x = 7
y = 9

if x < y
    println("$x < $y")
elseif x > y
    println("$x < $y")
else
    println("$x = $y")
end


function compare(x, y)
    if x < y
        println("$x < $y")
    elseif x > y
        println("$x < $y")
    else
        println("$x = $y")
    end
end

compare(1, 2)
compare(2, 1)
compare(2, 2)


function test(x, y)
    if x < y
        relation = "<"
    elseif x == y
        relation = "="
    else
        relation = ">"
    end
    println("$x $relation $y")
end

# boolean eval can only act on strict booleans:
#if 1 println("true") end # Error

println(x < y ? "less than" : "greater than or equal to")

v(x) = (println(x); x)
1 < 2 ? v("yes") : v("no")


