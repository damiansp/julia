for i = 1:10
    z = i
end

#println(z) # Error: UndefVarError: z not defined

x = 0
y = 0
for i = 1:10
    local x    # not necessary, local by default
    x = i + 1
    y = 2i + 2
end

println(x, y) # 00 


for i = 1:10
    global z
    z = i
end

for i in 1:10
    w = i
    global w # can declare here, too
end


println(z) # 10
println(w) # 10


x, y = 1, 2

function foo()
    x = 2
    return x + y # x is local, y is global
end

println(foo()) # 4
println(x)     # 1

function fubar()
    global x = 5
end

fubar()
println(x) # 5


x, y = 1, 2

function baz()
    x = 2 # new local
    function bar()
        x = 10 # modifies parent x
        return x + y
    end
    return bar() + x # 12 + 10
end

println(baz()) # 22


let state = 0
    global counter() = (state += 1)
end

println(counter()) # 1
println(counter()) # 2


x, y = 1, 2

function bar()
    x = 10 # local, not a closure var
    return x + y
end

function quz()
    x = 2 # local
    return bar() + x # 12 + 2
end

println(quz()) # 14
println(x, y) # 12 (unchanged)


f = y -> y + a
#println(f(a)) # Error; a not defined
a = 1
println(f(a)) # 2

