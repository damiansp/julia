fib = [1, 1, 2, 3, 5]
println(fib .^ 2) # 1 1 4 9 25
println(fib)      # 1 1 2 3 5
fib .^= 2
println(fib)      # 1 1 4 9 25
