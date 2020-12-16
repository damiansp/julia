"""
  RegularCartesianGrid{FT, TX, TY, TZ, R} <: AbstractGrid{FT, TX, TY, TZ}
A Cartesian grid with constant grid spacings `dx`, `dy`, `dz` between cell 
centers and cell faces, elements of type `FT`, topology `{TX, TY, TZ}`, and
coordinate ranges of type `R`
"""
struct RegularCartesianGrid{FT, TX, TY, TZ, R} <: AbstractGrid{FT, TX, TY, TZ}
  # No. grid points in (x, y, z)
  Nx::Int
  Ny::Int
  Nz::Int
  # Halo size in (x, y, z)
  Hx::Int
  Hy::Int
  Hz::Int
  # Domain size [m]
  Lx::FT
  Ly::FT
  Lz::FT
  # Grid spacing
  dx::FT
  dy::FT
  dz::FT
  # Range of coordinates at the centers of the cells
  xC::R
  yC::R
  zC::R
  # Range of grid coordinates at the faces of the cells
  xF::R
  yF::R
  zF::R
end


"""
  RegularCartesianGrid(
    [FT=Float64]; size, extent=nothing, x=nothing, y=nothing, z=nothing, 
    topology=(Periodic, Periodic, Bounded), halo=(1, 1, 1))
Creates a `RegularCartesianGrid` with `size=(Nx, Ny, Nz)` grid points.

Keyword arguments
=================
- `size` (required): A tuple prescribing the number of grid points in 
    non-`Flat` directions. `size` is a 3-tuple for 3D models, a 2-tuple for 2D 
    models, and either a scalar or 1-tuple for 1D models.
- `topology`: A 3-tuple `(Tx, Ty, Tz)` specifying the topology of the domain.
    `Tx`, `Ty`, and `Tz` specify whether the `x`-, `y`-, and `z` directions are
    `Periodic`, `Bounded`, or `Flat`. The topology `Flat` indicates that a model does not vary in that directions so that derivatives and 
    interpolation are zero. The default is `topology=(Periodic, Periodic, 
    Bounded)`.
- `extent`: A tuple prescribing the physical extent of the grid in non-`Flat` 
    directions. The origin for three-dimensional domains is the oceanic default 
    `(0, 0, -Lz)`.
- `x`, `y`, and `z`: Each of `x, y, z` are 2-tuples that specify the end points 
    of the domain in their respect directions. Scalar values may be used in 
    `Flat` directions.
    *Note*: _Either_ `extent`, or all of `x`, `y`, and `z` must be specified.
- `halo`: A tuple of integers that specifies the size of the halo region of 
    cells surrounding the physical interior for each non-`Flat` direction.
The physical extent of the domain can be specified via `x`, `y`, and `z` 
keyword arguments indicating the left and right endpoints of each dimensions, 
e.g., `x=(-π, π)` or via the `extent` argument, e.g. `extent=(Lx, Ly, Lz)` 
which specifies the extent of each dimension in which case 0 ≤ x ≤ Lx, 
0 ≤ y ≤ Ly, and -Lz ≤ z ≤ 0.
A grid topology may be specified via a tuple assigning one of `Periodic`, 
`Bounded, and `Flat` to each dimension. By default, a horizontally periodic 
grid topology `(Periodic, Periodic, Bounded)` is assumed.
Constants are stored using floating point values of type `FT`. By default this is `Float64`.
Make sure to specify the desired `FT` if not using `Float64`.

Grid properties
===============
- `(Nx, Ny, Nz)::Int`: Number of physical points in the (x, y, z)-direction
- `(Hx, Hy, Hz)::Int`: Number of halo points in the (x, y, z)-direction
- `(Lx, Ly, Lz)::FT`: Physical extent of the grid in the (x, y, z)-direction
- `(Δx, Δy, Δz)::FT`: Cell width in the (x, y, z)-direction
- `(xC, yC, zC)`: (x, y, z) coordinates of cell centers.
- `(xF, yF, zF)`: (x, y, z) coordinates of cell faces.
"""
function RegularCartesianGrid(
    FT=Float64; size, x=nothing, y=nothing, z=nothing, extent=nothing,
    topology=(Periodic, Periodic, Bounded), halo=nothing)
  
end