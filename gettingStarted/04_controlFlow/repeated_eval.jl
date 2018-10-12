# for
for n = 1:10 println(n^3) end

arr = [x^2 for x in 1:10]
for i = 1:length(arr) println("element $i is $(arr[i])") end

# better:
for (i, val) in enumerate(arr) println("element $i is $val") end


# nesting
for n = 1:5
    for m = 1:5 println("$n * $m = $(n * m)") end
end

# better
for n = 1:5, m = 1:5 println("$n * $m = $(n * m)") end

# or
[println("$n * $m = $(n * m)") for n in 1:5 for m in 1:5]



# while
a = 10
b = 15

while a < b
    global(a)
    println(a)
    a += 1
end

arr = [1, 2, 3, 4]
while !isempty(arr)
    print(pop!(arr), ", ")
end
println()


# break
