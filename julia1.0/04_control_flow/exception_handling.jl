function check_code(code)
  allowable = ["AO", "ZD", "SG", "EZ"]
  if code in allowable
    println("Code accepted")
  else
    throw(DomainError(code, "code not allowed"))
  end
end

check_code("AO")
#check_code("BB")


a = []
try
  pop!(a)
catch e
  println(typeof(e)) # ArgumentError
  println(e)         # ArgumentError("array must be non-empty")
end


try
  pop!(a)
catch e
  if isa(e, DomainError)
    println(e, " is a DomainError")
  elseif isa(e, ArgumentError)
    println(e, " is an ArgumentError")
  else
    println(e, " is some kind of error")
  end
end


ret =
  try
    global a = 4 * 2
  catch e
end

println(ret) # 8


try
  global f = open("break.jl") # IOStream<file file.txt>
  # do whatever
catch e
  # ...
finally
  close(f)
end


try
  open("break.jl") do f
    i = 0
    while(!eof(f))
      line = readline(f)
      println(line)
      i += 1
    end
    println("\n $i lines in file")
  end
catch e
finally
  close(f) # example only... not necessary for `open(file) do f ... end`
end
