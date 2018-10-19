A = [1., 2., 3.]
println(sin.(A))

f(x, y) = 3x + 4y
A = [1., 2., 3.]
B = [4., 5., 6.]
println(f.(pi, A))

Y = [1., 2., 3., 4.]
X = similar(Y) # preallocate output array
@. X = sin(cos(Y)) # same as X .= sin.(cos.(Y))
println(X)

# Function chaining
println([1:5;] .|> [x -> x^2, inv, x -> 2*x, -, isodd])
