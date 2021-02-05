module NilNumber


using NNlib
import Random


"""
  Nil <: Number
A singleton type with a single instance `nil`, but subtypes as `Number` (unlike 
`Nothing` and `Missing`).
"""
struct Nil <: Number end

const nil = Nil()

Nil(::T) where T <: Number = nil

(::Type{T})(::Nil) where T <: Number = nil

Base.convert(::Type{Nil}, ::Number) = nil
Base.float(::Type{Nil}) = nil


for f in [:copy, :zero, :one, :oneunit, :+, :-, :abs, :abs2, :inv, :exp, :log,
          :log1p, :log2, :log10, :sqrt, :tanh, :conj]
  @eval Base.$f(::Nil) = nil
end
for f in [:+, :-, :*, :/, :^, :mod, :div, :rem]
  @eval Base.$f(::Nil, ::Nil) = nil
end

Base.isless(::Nil, ::Nil) = true
Base.isless(::Nil, ::Number) = true
Base.isless(::Number, ::Nil) = true

Base.isnan(::Nil) = false

Base.typemin(::Type{Nil}) = nil
Base.typemax(::Type{Nil}) = nil

Base.promote_rule(x::Type{Nil}, y::Type{<:Numeric}) = Nil

Random.rand(rng::Random.AbstractRNG, ::Random.SamplerType{Nil}) = nil


end # mod



using .NilNumber: Nil, nil


"""
  outputsize(m, inputsize::Tuple; padbatch=False)
Calculate the size of the output from model `m` given the size of the input.
Obeys `outputsize(m, size(x)) == size(m(x))` for valid input `x`.
`padbatch=True` is equivalent to using `(inputsize..., 1)` and returns the final
size including this extra batch dimension.
Should be faster than clling `size(m(x))`. Uses trivial number type, which 
should wourk out of the box for custom layers.
If `m` is a `Tuple` or `Vector`, its elements are applied in sequence, like
`Chain(m...)`
"""
function outputsize(m, inputsizes::Tuple...; padbatch=false)
  x = nil_input(padbatch, inputsizes...)
  return size(m(x))
end


nil_input(pad::Bool, s::Tupl{Vararg{Integer}}) = (
  pad ? fill(nil, (s..., 1)) : fill(nil, s))
nil_input(pad::Bool, multi::Tuple{Vararg{Integer}}...) = nil_input.(pad, multi)
nil_input(pad::Bool, tup::Tuple{Vararg{Tuple}}) = nil_input(pad, tup...)
