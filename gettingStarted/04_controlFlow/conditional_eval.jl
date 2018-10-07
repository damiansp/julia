var = 7

if var > 10
    println("var $var >  10")
elseif var < 10
    println("var $var < 10")
else
    println("var $var = 10")
end

a = 10
b = 15
z = if a > b a else b end
println("z = $z")

z = a > b ? a : b
println("z = $z")

varout = "var has value $var"
cond = var > 10 ? "and is > 10" :  var < 10 ? "and is < 10" : "and is = 10"
println("$varout $cond")
