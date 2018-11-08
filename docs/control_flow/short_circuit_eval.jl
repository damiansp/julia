#if <cond> <statement> end   # Equivalent to:
#<cond> && <statement>

#if !<cond> <statement> end  # Equivalent to:
# <cond> || <statement>

function fact(n::Int)
    n >= 0 || error("n cannot be negative")
    n == 0 && return 1
    n * fact(n - 1)
end

# &, | do NOT short circuit
t(x) = (println(x); true)
f(x) = (println(x); false)

println(f(1) && f(2)) # 1 false
println(f(1) & f(2))  # 1 2 false
println(t(1) || f(2)) # 1 true
println(t(1) | t(2))  # 1 2 true
