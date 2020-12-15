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


function validate_halo(TX, TY, TZ, halo)
  halo = tupleit(halo)
  validate_tupled_argument(
    halo, Integer, "halo", topological_tuple_length(TX, TY, TZ))
  inflate_tuple(TX, TY, TZ, halo, default=0)
end


coordinate_name(i) = i == 1 ? "x" : i == 2 ? "y" : "z"


function validate_dimension_specification(T, xi, dir)
  isnothing(xi) && throw(
    ArgumentError(
      "Must supply extent or $dir keyword when $dir-direction is $T."))
  length(xi) == 2 || throw(ArgumentError("$dir length($xi) must be 2."))
  all(isa.(xi, Number)) || throw(
    ArgumentError("$dir=$xi should contain numbers."))
  xi[2] >= xi[1] || throw(
    ArgumentError("$dir=$xi should be an increasing interval"))
end

validate_dimension_specification(::Type{Flat}, xi::Tuple, dir) = xi
validate_dimension_specification(::Type{Flat}, ::Nothing, dir) = (0, 0)
validate_dimension_specification(::Type{Flat}, xi::Number, dir) = (xi, xi)


default_horizontal_extent(T, extent) = (0, extent[i])
default_vertical_extent(T, extent) = (-extent[3], 0)


function validate_regular_grid_domain(TX, TY, TZ, FT, extent, x, y, z)
  # Find domain endpoints or extent, according to user input
  if !isnothing(extent) # user has specified extent
    (!isnothing(x) || !isnothing(y) || !isnothing(z)) && throw(
      ArgumentError(
        "Cannot specify both 'extent' and 'x, y, z' keyword arguments."))
    extent = tupleit(extent)
    validate_tupled_argument(
      extent, Number, "extent", topological_tuple_length(TX, TY, TZ))
    Lx, Ly, Lz = extent = inflate_tuple(TX, TY, TZ, extent, default=0)

    # An "oceanic" default domain:
    x = (0, Lx)
    y = (0, Ly)
    z = (-Lz, 0)
  else 
    x = validate_dimension_specification(TX, x, :x)
    y = validate_dimension_specification(TY, y, :y)
    z = validate_dimension_specification(TZ, z, :z)
    Lx = x[2] - x[1]
    Ly = y[2] - y[1]
  end
  FT(Lx), FT(Ly), FT(Lz), FT.(x), FT.(y), FT.(z)
end