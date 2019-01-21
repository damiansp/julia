var = 7
if var > 10
  println("$var > 10")
elseif var < 10
  println("$var < 10")
else
  println("$var = 10")
end

a = 10
b = 15
z = if a > b a else b end
println("$z is the larger of $a and $b")

z = a < b ? a : b
println("$z is the smaller of $a and $b")

varout = "var has value: $var"
cond = var > 10 ? "and is bigger than 10" : (
  var < 10 ? "and is smaller than 10" : "and is 10")
println("$varout $cond")

function sqroot(n::Int)
  n >= 0 || error("n must not be negative") # if !(n >= 0) error()
  n == 0 && return 0                        # if n == 0 return 0
  sqrt(n)
end

