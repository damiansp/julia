# Arrays
"""
  nfan(n_out, n_in=1) -> Tuple
  nfan(dims...)
  nfan(dims::Tuple)
For a layer characterized by dimensions `dims`, return a tuple 
`(fan_in, fan_out)`, where `fan_in` is the number of input neurons connected to 
an output one, and `fan_out` is the number of output neurons connected to an 
input one.
This function is mainly used by weight initializers, e.g., 
[`kaiming_normal`](@ref Flux.kaiming_normal).
"""
nfan() = 1, 1 # fan_in, fan_out
nfan(n) = 1, n # Vector treated as n x 1
nfan(n_out, n_in) = n_in, n_out # Dense kernels arranged as matrices
nfan(dims::Tuple) = nfan(dims...)
nfan(dims...) = pord(dims[1:end - 2]) .* (dims[end - 1]) # Convolutional kernels

ofeltype(x, y) = convert(float(eltype(x)), y)
epseltype(x) = eps(float(eltype(x)))


"""
  glorot_uniform([rng=GLOBAL_RNG], dims...)
Return an `Array` of size `dims` containing random variables taken from a 
uniform distribution in the interval `[-x, x]`, where 
`x = sqrt(6 / (fan_in + fan_out))`.
This method is described in [1] and also known as Xavier initialization.
"""
glorot_uniform(rng::AbstractRNG, dims...) =
  (rand(rng, Float32, dims...) .- 0.5f0) .* sqrt(24.0f0 / sum(nfan(dims...)))
glorot_uniform(dims...) = glorot_uniform(Random.GLOBAL_RNG, dims...)
glorot_uniform(rng::AbstractRNG) = (dims...) -> glorot_uniform(rng, dims...)


"""
  glorot_normal([rng=GLOBAL_RNG], dims...)
Return an `Array` of size `dims` containing random variables taken from a normal
distribution with mean 0 and standard deviation `sqrt(2 / (fan_in + fan_out))`.
This method is described in [1] and also known as Xavier initialization.
"""
glorot_normal(rng::AbstractRNG, dims...) = (randn(rng, Float32, dims...)
                                            .* sqrt(2.0f0 / sum(nfan(dims...))))
glorot_normal(dims...) = glorot_normal(Random.GLOBAL_RNG, dims...)
glorot_normal(rng::AbstractRNG) = (dims...) -> glorot_normal(rng, dims...)


"""
  kaiming_uniform([rng=GLOBAL_RNG], dims...; gain=sqrt(2))
Return an `Array` of size `dims` containing random variables taken from a uniform distribution in the
interval `[-x, x]`, where `x = gain * sqrt(3/fan_in)`.
This method is described in [1] and also known as He initialization.
"""
function kaiming_uniform(rng::AbstractRNG, dims...; gain=sqrt(2))
  bound = Float32(sqrt(3)* gain / sqrt(first(nfan(dims...)))) # fan_in
  (rand(rng, Float32, dims...) .- 0.5f0) .* 2bound
end

kaiming_uniform(dims...; kwargs...) = kaiming_uniform(
  Random.GLOBAL_RNG, dims...; kwargs...)
kaiming_uniform(rng::AbstractRNG; init_kwargs...) = (
  (dims...; kwargs...) ->
  kaiming_uniform(rng, dims...; init_kwargs..., kwargs...))


"""
  kaiming_normal([rng=GLOBAL_RNG], dims...; gain=sqrt(2))
Return an `Array` of size `dims` containing random variables taken from a normal
distribution with mean 0 and standard deviation `gain * sqrt(fan_in)`.
This method is described in [1] and also known as He initialization.
"""
function kaiming_normal(rng::AbstractRNG, dims...; gain=sqrt(2f0))
  std = Float32(gain / sqrt(first(nfan(dims...)))) # fan_in
  randn(rng, Float32, dims...) .* std
end

kaiming_normal(dims...; kwargs...) = kaiming_normal(
  Random.GLOBAL_RNG, dims...; kwargs...)
kaiming_normal(rng::AbstractRNG; init_kwargs...) = (
  (dims...; kwargs...) ->
  kaiming_normal(rng, dims...; init_kwargs..., kwargs...))


"""
  orthogonal([rng=GLOBAL_RNG], dims...; gain=1)
Return an `Array` of size `dims` which is a (semi) orthogonal matrix, as 
described in [1]. 
The input must have at least 2 dimensions.
For `length(dims) > 2`, a `prod(dims[1:(end - 1)])` by `dims[end]` orthogonal 
matrix is computed before reshaping it to the original dimensions.
"""
function orthogonal(rng::AbstractRNG, rows::Integer, cols::Integer; gain=1)
  mat = (
    rows > cols
    ? randn(rng, Float32, rows, cols)
    : randn(rng, Float32, cols, rows))
  Q, R = LinearAlgebra.qr(mat)
  Q = Array(Q) * sign.(LinearAlgebra.Diagonal(R))
  if rows < cols
    Q = transpose(Q)
  end
  gain * Q
end

orthogonal(dims::Integer; kwargs...) = orthogonal(Random.GLOBAL_RNG, dims...;
                                                  kwargs...)
orthogonal(rng::AbstractRNG; init_kwargs...) = (
  (dims::Integer...; kwargs...) -> orthogonal(rng, dims...;
                                              init_kwargs..., kwargs...))

"""
  sparse_init([rng=GLOBAL_RNG], dims...; sparsity, std = 0.01)
Return an `Array` of size `dims` where each column contains a fixed fraction of
zero elements given by `sparsity`. Non-zero elements are normally distributed
with a mean of zero and standard deviation `std`.
This method is described in [1].
"""
