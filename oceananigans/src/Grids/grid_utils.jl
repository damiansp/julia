# Convenience functions
Base.length(loc, topo, N) = N
Base.length(::Type{Face}, ::Type{Bounded, N) = N + 1
Base.length(::Type{Nothing}, topo, N) = 1


function Base.size(loc, grid::AbstractGrid)
  N = (grid.Nx, grid.Ny, grid.Nz)
  return Tuple(length(loc[d], topology(grid, d), N[d]) for d in 1:3)
end

Base.size(loc, grid, d) = size(loc, grid)[d]


"""
    size(loc, grid)
Returns the size of a field at `loc` on `grid`, not including any halos.
This is a triple of ints corresponding to the number of interior nodes of `f` 
along `x, y, z`.
"""
@inline size(loc, grid) = (length(loc[1], topology(grid, 1), grid.Nx), 
                           length(loc[2], topology(grid, 2), grid.Ny), 
                           length(loc[3], topology(grid, 3), grid.Nz))

total_size = size(a) # fallback


"""
    total_size(loc, grid)
Returns the "total" size of a field at `loc` on `grid`.
This is a triple of ints corresponding to the number of grid points contained 
by `f` along `x, y, z`.
"""
@inline total_size(loc, grid) = (
  total_length(loc[1], topology(grid, 1), grid.Nx, grid.Hx),
  total_length(loc[2], topology(grid, 2), grid.Ny, grid.Hy),
  total_length(loc[3], topology(grid, 3), grid.Nz, grid.Hz))


"""
    total_extent(topology, H, delta, L)
Returns the total extent, including halo regions, of constant-spaced `Periodic` 
and `Flat` dimensions with number of halo points `H`, constant grid spacing 
`delta`, and interior extent `L`.
"""
@inline total_extent(topology, H, delta, L) = L + (2H - 1)*delta