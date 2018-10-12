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


# Short-circuit evaluation
# if <cond> <statement> end # ->
# <cond> && <statement>

# if !<cond> <statement> end # ->
# <cond> || <statement>

# Example
function sqroot(n::Int)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 0
    sqrt(n)
end

println(sqroot(4))
println(sqroot(0))
#println(sqroot(-6)) # throws exception


