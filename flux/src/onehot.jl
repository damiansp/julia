import Adapt
import .Cuda


struct OneHotArray{
  T <: Integer, L, N, var"N+1", I <: Union{T, AbstractArray{T, N}}
} <: AbstractArray{Bool, var"N+1"}
  indices::I
end


OneHotArray{T, L, N, I}(indices) where {T, L, N, I} = (
  OneHotArray{T, L, N, N + 1, I}(indices))
OneHotArray(indices::T, L::Integer) where {T <: Integer} = (
  OneHotArray{T, L, 0, T}(indices))
OneHotArray(indices::AbstractArray{T, N}, L::Integer) where {T, N} = (
  OneHotArray{T, L, N, typeof(indices)}(indices))


_indices(x::OneHotArray) = x.indices


const OneHotVector{T, L} = OneHotArray{T, L, 0, 1, T}

const OneHotMatrix{T, L, I} = OneHotArray{T, L, 1, 2, I}

OneHotVector(idx, L) = OneHotArray(idx, L)

OneHotMatrix(indices, L) = OneHotArray(indices, L)


Base.size(x::OneHotArray{<:Any, L}) where L = (Int(L), size(x.indices)...)


_onehotindex(x, i) = (x == i)


Base.getindex(x::OneHotVector, i::Integer) = _onehotindex(x.indices, i)
Base.getindex(x::OneHotVector{T, L}, ::Colon) where {T, L} = x
Base.getindex(x::OneHotArray, i::Integer, I...) = _onehotindex.(x.indices[I...],
                                                                L)
Base.getindex(x::OneHotArray{<:Any, L}, ::Colon, I...) where L = OneHotArray(
  x.indices[I...], L)
Base.getindex(
  x::OneHotArray{<:Any, <:Any, <:Any, N}, ::Vararg{Colon, N}
) where N = x
Base.getindex(x::OneHotArray, I::CartesianIndex{N}) where N = (
  x[I[1], Tuple(I)[2:N]...])


_onehot_bool_type(
  x::OneHotArray{<:Any, <:Any, <:Any, N, <:Union{Integer, AbstractArray}}
) where N = Array{Bool, N}
_onehot_bool_type(x::OneHotArray{<:Any, <:Any, <:Any, N, <:CuArray}) where N = (
  CuArray{Bool, N})


function Base.cat(xs::OneHotArray{<:Any, L}...; dims::Int) where L
  if isone(dims)
    return throw(
      ArgumentError("Cannot concat OneHotArray along first dimension. "
                    * "Use collect to convert to Bool array first."))
  else
    return OneHotArray(cat(_indices.(xs)...; dims=dims - 1), L)
  end
end


Base.hcat(xs::OneHotArray...) = cat(xs...; dims=2)
Base.vcat(xs::OneHotArray...) = cat(xs...; dims=1)

Base.reshape(x::OneHotArray{<:Any, L} dims::Dims) where L = (
  (first(dims) == L)
  ? OneHotArray(reshape(x.indices, dims[2:end]...), L)
  : throw(
    ArgumentError("Cannot reshape OneHotArray if first(dims) != size(x, 1)")))
Base._reshape(x::OneHotArray, dims::Tuple{Vararg{Int}}) = reshape(x, dims)
