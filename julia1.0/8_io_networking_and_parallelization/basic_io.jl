stream = stdin
for line in eachline(stream)
  if line == "quit" break end
  println("$line")
end


while !eof(stream)
  x = read(stream, Char)
  println("$x")
end
