triple(x) = 3x
println(map(triple, [1, 1, 2, 3, 5, 8, 13]))
println(map(x -> 3x, [1, 1, 2, 3, 5, 8, 13]))

println(map(
  x -> 
    if x % 2 == 0
      2x
    elseif x % 3 == 0
      3x
    elseif x % 5 == 0
      5x
    else
      x
    end,
  [1, 1, 2, 3, 5, 8, 13]))

# Equivalent:
map([1, 1, 2, 3, 5, 8, 13]) do x
  if x % 2 == 0
    2x
  elseif x % 3 == 0
    3x
  elseif x % 5 == 0
    5x
  else
    x
  end
end
