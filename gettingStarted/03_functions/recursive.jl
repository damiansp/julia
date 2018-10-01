function a(x)
    z = 2x
    function b(z)
        z += 1
    end
    b(z)
end

d = 5
println(a(d)) # 2*5 + 1 = 11


sum(n) = n > 1 ? sum(n-1) + n : n
println(sum(11))

fib(n) = n < 2 ? n : fib(n - 1) + fib(n - 2)
println(fib(11))

