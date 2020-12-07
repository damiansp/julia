using Oceananigans: tupleit


# Validation tools

# Tuple inflation for topologies with Flat dims
inflate_tuple(TX, TY, TZ, tup; default) = tup
inflate_tuple(::Type{Flat}, TY, TZ, tup; default) = tuple(
  default, tup[1], tup[2])
inflate_tuple(TY, ::Type{Flat}, TZ, tup; default) = tuple(
  tup[1], default, tup[2])
inflate_tuple(TY, TZ, ::Type{Flat}, tup; default) = tuple(
  tup[1], tup[2], default)
inflate_tuple(TX, ::Type{Flat}, ::Type{Flat}, tup; default) = (
  tup[1], default, default)
inflate_tuple(::Type{Flat}, TY, ::Type{Flat}, tup; default) = (
  default, tup[1], default)
inflate_tuple(::Type{Flat}, ::Type{Flat}, TZ, tup; default) = (
  default, default, tup[1])
inflate_tuple(::Type{Flat}, ::Type{Flat}, ::Type{Flat}, tup; default) = (
  default, default, default)

topological_tuple_length(TX, TY, TZ) = sum(T === Flat ? 0 : 1 
                                           for T in (TX, TY, TZ))


"""Validate that an arg tuple is the right length and has elems of `argtype`"""
function validate_tupled_argument(arg, argtype, argname, len=3; greater_than=0)
  length(arg) == len || throw(ArgumentError("length($argname) must be $len."))
  all(isa.(arg, argtype)) || throw(
    ArgumentError("$argname=$arg must contain $argtype s."))
  all(arg .> greater_than) || throw(
    ArgumentError("Elements of $argname=$arg must be > $greater_than."))
  nothing
end


# Input validation

function validate_topology(topology)
  for T in topology
    if !isa(T(), AbstractTopology)
      e = ("$T is not a valid topology! Valid topologies are: Peridodic, "
           * "Bounded, Flat.")
      throw(ArgumentError(e))
    end
  end
  topology
end


function validate_size(TX, TY, TZ, size)
  size = tupleit(size)
  validate_tupled_argument(
    size, Integer, "size", topological_tuple_length(TX, TY, TZ))
  inflate_tuple(TX, TY, TZ, size, default=1)
end


function valideate_halo()
  # TODO
end