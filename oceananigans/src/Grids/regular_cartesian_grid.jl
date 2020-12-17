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
  TX, TY, TZ = validate_topology(topology)
  size = validate_size(TX, TY, TZ, size)
  halo = validate_halo(TX, TY, TZ, halo)
  Lx, Ly, Lz, x, y, z = validate_regular_grid_domain(
    TX, TY, TZ, FT, extent, x, y, z)
  # Un/packing
  Nx, Ny, Nz = N = size
  Hx, Hy, Hz = H = halo
  L = (Lx, Ly, Lz)
  dx, dy, xz = delta = L ./ N
  X1 = (x[1], y[1], z[1])
  # Face-node limits in x, y, z
  xFneg, yFneg, zFneg = XFneg = @. X1 - H*delta
  xFpos, yFpos, zFpos = XFpos = (@. XFneg 
                                 + total_extent(topology, halo, delta, L))
  # Cell-node limits in x, y, z
  xCneg, yCneg, zCneg = XCneg = @. XFneg + delta / 2
  xCpos, yCpos, zCpos = XCpos = @. XCneg + L + delta*(2H - 1)
  TFx, TFy, TFz = total_length.(Face, topology, N, H)
  TCx, TCy, TCz = total_length.(Cell, topology, N, H)
  # Include halo points in coordinate arrays
  xF = range(xFneg, xFpos; length=TFx)
  yF = range(yFneg, yFpos; length=TFy)
  zF = range(zFneg, zFpos; length=TFz)
  xC = range(xCneg, xCpos; length=TCx)
  yC = range(yCneg, yCpos; length=TCy)
  zC = range(zCneg, zCpos; length=TCz)
  # Offset
  xF = OffsetArray(xF, -Hx)
  yF = OffsetArray(yF, -Hy)
  zF = OffsetArray(zF, -Hz)
  xC = OffsetArray(xC, -Hx)
  yC = OffsetArray(yC, -Hy)
  zC = OffsetArray(zC, -Hz)
  RegularCartesianGrid{FT, TX, TY, TZ, typeof(xC)}(
    Nx, Ny, Nz, Hx, Hy, Hz, Lx, Ly, Lz, dx, dy, dz, xC, yC, zC, xF, yF, zF)
end