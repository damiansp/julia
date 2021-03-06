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


nil_input(pad::Bool, s::Tuple{Vararg{Integer}}) = (
  pad ? fill(nil, (s..., 1)) : fill(nil, s))
nil_input(pad::Bool, multi::Tuple{Vararg{Integer}}...) = nil_input.(pad, multi)
nil_input(pad::Bool, tup::Tuple{Vararg{Tuple}}) = nil_input(pad, tup...)


function outputsize(
    m::Chain, inputsizes::Tuple{Vararg{Integer}}...; padbatch=false)
  x = nil_input(padbatch, inputsizes...)
  for (i, lay) in enumerate(m.layers)
    try
      x = lay(x)
    catch err
      str = x isa AbstractArray ? "with input of size $(size(x))" : ""
      @error "layer $lay, index $i in Chain, gave ann error $str"
      rethrow(err)
    end
  end
  return size(x)
end


"""
  outputsize(m, x_size, y_size, ...; padbatch=false)
For model or layer `m` accepting multiple arrays as input,
this returns `size(m((x, y, ...)))` given `size_x = size(x)`, etc
"""
outputsize

# make tuples and vectors be like Chains
outputsize(m::Tuple, input::Tuple...; padbatch=false) = (
  outputsize(Chain(m...), input...; padbatch=padbatch))
outputsize(m::AbstractVector, input::Tuple...; padbatch=false) = (
  outputsize(Chain(m...), input...; padbatch=padbatch))


# bypass statistics in normalization layers
for layer in (:LayerNorm, :BatchNorm, :InstanceNorm, :GroupNorm)
  @eval (l::$layer)(x::AbstractArray{Nil}) = x
end


# fixes for layers that don't work out-of-the-box
for (fn, Dims) in ((:conv, DenseConvDims), (:depthwiseconv, DepthwiseConvDims))
  @eval begin
    function NNlib.$fn(
        a::AbstractArray{Nil}, b::AbstractArray{Nil}, dims::$Dims)
      fill(
        nil, NNlib.output_size(dims)..., NNlib.channels_out(dims), size(a)[end])
    end

    function NNlib.$fn(
        a::AbstractArray{<:Real}, b::AbstractArray{Nil}, dims::$Dims)
      NNlib.$fn(fill(nil, size(a)), b, dims)
    end

    function NNlib.$fn(
        a::AbstractArray{Nil}, b::AbstractArray{<:Real}, dims::$Dims)
      NNlib.$fn(a, fill(nil, size(b)), dims)
    end
  end
end
