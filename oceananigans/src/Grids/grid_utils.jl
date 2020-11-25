#=========#=========#=========#=========#=========#=========#=========#=========
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


"""
    total_extent(::Type{Bounded}, H, delta, L)
Returns the total extent, including halo regions, of constant-spaced `Bounded` 
and `Flat` dimensions with number of halo points `H`, constant grid spacing 
`delta`, and interior extent `L`
"""
@inline total_extent(::Type{Bounded}, H, delta, L) = L + 2H*delta


"""
    total_length(loc, topo, N, H=0)
Returns the total length (no. of nodes), including halo points, of a field 
located at `Cell` centers along a grid dim of len `N` and with halo points `H`.
"""
@inline total_length(loc, topo, N, H=0) = N + 2H


"""
    total_length(::Type{Face}, ::Type{Bounded}, N, H=0)
Returns the total len, including halo points, of a field located at cell `Face`s
along a grid dim of len `N` and with halo points `H`.
"""
@inline total_length(::Type{Face}, ::Type{Bounded}, N, H=0) = N + 1 + 2H


"""
    total_length(::Type{Nothing}, topo, N, H=0)
Returns 1, the 'len' of a field along a reduced dim.
"""
@inline total_length(::Type{Nothing}, topo, N, H=0) = 1


# Grid domains
@inline domain(topo, N, xi) = xi[1], xi[N + 1]
@inline domain(::Type{Flat}, N, xi) = xi[1], xi[1]

@inline x_domain(grid) = domain(toplogy(grid, 1), grid.Nx, grid.xF)
@inline y_domain(grid) = domain(toplogy(grid, 2), grid.Ny, grid.yF)
@inline z_domain(grid) = domain(toplogy(grid, 3), grid.Nz, grid.zF)


# Indexing
@inline left_halo_indices(loc, topo, H) = 1 - H:0
@inline left_halo_indices(::Type{Nothing}, topo, N, H) = 1:0 # empty 