x = 9
function funscope(n)
  x = 0
  for i = 1:n
    local x
    x = i + 1
    if (x == 7) println("This is the local x in for: $x") end # 7
  end
  println("This is the local x in funscope: $x") # 0
  global x = 15
end

funscope(10)
println("Global x: $x") # 15


anon = Array{Any}(undef, 2)
for i = 1:2
  anon[i] = () -> println(i)
  i += 1
end

println(anon) # Any[##3#4(Box(2)), ##3#4(Box(3))]
anon[1]() # 2
anon[2]() # 3

anon = Array{Any}(undef, 2)
for i = 1:2
  let i = i
    anon[i] = () -> println(i)
  end
  i += 1
end

println(anon) # Any[##5#6{Int64}(1), ##5#6{Int64}(2)]
anon[1]() # 1
anon[2]() # 2


begin
  local x = 1
  let
    local x = 2
    println(x) # 2
  end
  println(x) # 1
end


i = 0
for i = 1:10
end
println(i) # 0


i = 0
[i for i = 1:10]
println(i) # 0

