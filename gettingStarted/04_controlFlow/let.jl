anon = cell(2) # meant to return a 2-element array

for i = 1:2
    anon[i] = () -> prinln(i)
    i += 1
end

# prints 2 & 3 (!)
# Fix:

for i = 1:2
    let i = i
        anon[i] = () -> println(i)
    end
    i += 1
end


# let also introduces new scope
begin
    local x = 1
    let
        local x = 2
        println(x) # 2
    end
    println(x) # 1
    x
end


# Régarde:
i = 0
for i = 1:10 end
println(i) # 0

#i = 0
#for global i = 1:10 end # ERROR
#println(i)

i = 0
[i for i = 1:10]
println(i) # 0
