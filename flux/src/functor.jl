import Adapt: adapt, adapt_storage
import Functors: @functor, functor, fmap
using LinearAlgebra: Cholesky
using Zygote: IdSet


trainable(m) = functor(m)[1]


"""
  testmode!(m, mode = true)
Set a layer or model's test mode (see below).
Using `:auto` mode will treat any gradient computation as training.
_Note_: if you manually set a model into test mode, you need to manually place
it back into train mode during training phase.
Possible values include:
- `false` for training
- `true` for testing
- `:auto` or `nothing` for Flux to detect the mode automatically
"""
testmode!(m, mode=true) = (foreach(x -> testmode!(x, mode), trainable(m)); m)


"""
  trainmode!(m, mode = true)
Set a layer of model's train mode (see below).
Symmetric to [`testmode!`](@ref) 
  (i.e. `trainmode!(m, mode) == testmode!(m, !mode)`).
_Note_: if you manually set a model into train mode, you need to manually place
it into test mode during testing phase.
Possible values include:
- `true` for training
- `false` for testing
- `:auto` or `nothing` for Flux to detect the mode automatically
"""
trainmode!(m, mode=true) = (
  mode isa Bool ? testmode!(m, !mode) : testmode!(m, mode))


params!(p::Params, x::AbstractArray{<:Number}, seen=IdSet()) = push!(p, x)


function params!(p::Params, x, seen=IdSet())
  x in seen && return
  push!(seen, x)
  for child in trainable(x)
    params!(p, child, seen)
  end
end
