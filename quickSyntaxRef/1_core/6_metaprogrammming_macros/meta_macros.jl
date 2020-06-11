# 1. Symbols
a = :foo10
b = Symbol("foo10")
c = Symbol("foo", 10)
println("$a, $b, $c") # all equivalent



# 2. Expressions
a = 5
expr = Meta.parse("b = a + 1 # a comment")
println("typeof(expr): $(typeof(expr))")
dump(expr)


# 2.1 Creating Expressions
# All equivalent
ex1 = Meta.parse("b = a + 1 # and comment")
ex2 = :(b = a + 1)
ex3 = quote
  b = a + 1
end


# 2.2 Evaluating Symbols and Expressions
e1 = Meta.parse("$a + b + 3")
e2 = :($a + b + 3)             # equiv
e3 = quote $a + b + 3 end      # equiv
e4 = Expr(:call, :+, a, :b, 3) #equiv

#eval(e1) # Error: b not defined
b = 10
println(eval(e1)) # 18
a = 100
println(eval(e1)) # 18!
b = 100
println(eval(e1)) # 108



# 3. Macros


# 3.1 Macro Definition
# A macro is a function that returns an expression
macro customloop(controlexpr, workexpr)
  return quote
    for i in $controlexpr
      $workexpr
    end
  end
end


# 3.2 Macro Invocation
@customloop 1:4 println(i)
@customloop 1:a println(i)
@customloop 1:a if i > 3 println(i) end
@customloop ["apple", "orange", "banana"] println(i)
@customloop ["apple", "orange", "banana"] begin 
  print("i: ")
  println(i)
end

print(@macroexpand @customloop 1:4 println(i))
println()

# 3.3 String Macros
macro print5_str(str)
  limits = collect(1:5:length(str))
  for (i, j) in enumerate(limits)
    st = j
    en = i == length(limits) ? length(str) : j + 4
    println(str[st:en])
  end
end

@print5_str "a man, a plan, a canal: Panama!"
