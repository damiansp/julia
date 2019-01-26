a = 10
b = 150
while a < b
  println(a)
  global a += 5
  if a >= 150 break end
end

arr = rand(1:10, 10)
println(arr)
searched = 4
for (i, curr) in enumerate(arr)
  if curr == searched
    println("The searched element $searched occurs at index $i")
    break
  end
end
