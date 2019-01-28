for n = 1:10
  println(n^3)
end

arr = [x^2 for x in 1:10]
for i = 1:length(arr)
  println("$i^2 = $(arr[i])")
end

for (i, val) in enumerate(arr)
  println("$i -> $val")
end

for n = 1:5
  for m = 6:9
    println("$n * $m = $(n * m)")
  end
end

for n = 1:3, m = 4:6
  println("$n * $m = $(n * m)")
end

