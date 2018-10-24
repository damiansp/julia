# Tasks have been deprecated since 0.7

# Producers are similar to Python generators
function fib_producer(n)
    a, b = (0, 1)
    for i = 1:n
        produce(b)
        a, b = (b, a + b)
    end
end

fib_producer(5) # waits indefinitely
