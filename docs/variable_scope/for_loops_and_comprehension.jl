Fs = Vector{Any}(undef, 2)

for j = 1:2
  Fs[j] = () -> j
end

println(Fs[1]()) # 1
println(Fs[2]()) # 2


function f()
  i = 0
  for i = 1:3
  end
  return i
end

println(f()) # 0

function g()
  i = 0
  for outer i = 1:3
  end
  return i
end

println(g()) # 3
