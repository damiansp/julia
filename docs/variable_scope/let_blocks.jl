x, y, z = -1, -1, -1

let x = 1, z
  println("x: $x, y: $y") # 1, -1
  #println("z: $z") # err
end


Fs = Vector{Any}(undef, 2)
i = 1

while i <= 2
  Fs[i] = () -> i
  global i += 1
end

println(Fs[1]()) # 3
println(Fs[2]()) # 3

Fs = Vector{Any}(undef, 2)
i = 1

while i <= 2
  let i = i
    Fs[i] = () -> i
  end
  global i += 1
end

println(Fs[1]()) # 1
println(Fs[2]()) # 2


