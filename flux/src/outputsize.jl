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
