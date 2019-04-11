a = 10
b = 15
while a < b
  println(a)
  global a += 1
end

arr = [1, 2, 3, 4]
while !isempty(arr)
  print(pop!(arr), ", ")
end
