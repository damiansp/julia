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

@inline x_domain(grid) = domain(topology(grid, 1), grid.Nx, grid.xF)
@inline y_domain(grid) = domain(topology(grid, 2), grid.Ny, grid.yF)
@inline z_domain(grid) = domain(topology(grid, 3), grid.Nz, grid.zF)


# Indexing
@inline left_halo_indices(loc, topo, H) = 1 - H:0
@inline left_halo_indices(::Type{Nothing}, topo, N, H) = 1:0 # empty

@inline right_halo_indices(loc, topo, H) = N + 1:N + H
@inline right_halo_indices(::Type{Face}, ::Type{Bounded}, N, H) = 
  N + 2:N + H + 1
@inline right_halo_indices(::Type{Nothing}, topo, N, H) = 1:0 # empty

@inline underlying_left_halo_indices(loc, topo, N, H) = 1:H
@inline underlying_left_halo_indices(::Type{Nothing}, topo, N, H) = 1:0 # empty

@inline underlying_right_halo_indices(loc, topo, N, H) = N + H + 1:N + 2H
@inline underlying_right_halo_indices(::Type{Face}, ::Type{Bounded}, N, H) =
  N + H + 2:N + 2H + 1
@inline underlying_right_halo_indices(::Type{Nothing}, topo, N, H) = 1:0 # empty

@inline interior_indices(loc, topo, N) = 1:N
@inline interior_indices(::Type{Face}, ::Type{Bounded}, N) = 1:N + 1
@inline interior_indices(::Type{Nothing}, topo, N) = 1:1

@inline interior_x_indices(loc, grid) = interior_indices(
  loc, topology(grid, 1), grid.Nx)
@inline interior_y_indices(loc, grid) = interior_indices(
  loc, topology(grid, 2), grid.Ny)
@inline interior_z_indices(loc, grid) = interior_indices(
  loc, topology(grid, 3), grid.Nz)

@inline interior_parent_indices(loc, topo, N, H) = 1 + H:N + H
@inline interior_parent_indices(::Type{Face}, ::Type{Bounded}, N, H) = 
  1 + H:N + H + 1
@inline interior_parent_indices(::Type{Nothing}, topo, N) = 1:1

# All indices (including halos)
@inline all_indices(loc, topo, N, H) = 1 - H:N + H
@inline all_indices(::Type{Face}, ::Type{Bounded}) = 1 - H:N + H + 1
@inline all_indices(::Type{Nothing}, topo, N, H) = 1:1

@inline all_x_indices(loc, grid) = all_indices(
  loc, topology(grid, 1), grid.Nx, grid.Hx)
@inline all_y_indices(loc, grid) = all_indices(
  loc, topology(grid, 2), grid.Ny, grid.Hy)
@inline all_z_indices(loc, grid) = all_indices(
  loc, topology(grid, 3), grid.Nz, grid.Hz)

@inline all_parent_indices(loc, topo, N, H) = 1:N + 2H
@inline all_parent_indices(::Type{Face}, ::Type{Bounded}, N, H) = 1:N + 2H + 1
@inline all_parent_indices(::Type{Nothing}, topo, N, H) = 1:1

@inline all_parent_x_indices(loc, grid) = all_parent_indices(
  loc, topology(grid, 1), grid.Nx, grid.Hx)
@inline all_parent_y_indices(loc, grid) = all_parent_indices(
  loc, topology(grid, 2), grid.Ny, grid.Hy)
@inline all_parent_z_indices(loc, grid) = all_parent_indices(
  loc, topology(grid, 3), grid.Nz, grid.Hz)


# Nodes

# Node by node
@inline xnode(::Type{Cell}, i, grid) = @inbounds grid.xC[i]
@inline xnode(::Type{Face}, i, grid) = @inbounds grid.xF[i]
@inline ynode(::Type{Cell}, j, grid) = @inbounds grid.yC[j]
@inline ynode(::Type{Face}, j, grid) = @inbounds grid.yF[j]
@inline znode(::Type{Cell}, k, grid) = @inbounds grid.zC[k]
@inline znode(::Type{Face}, k, grid) = @inbounds grid.zF[k]

# Convenience
@inline xC(i, grid) = xnode(Cell, i, grid)
@inline xF(i, grid) = xnode(Face, i, grid)
@inline yC(j, grid) = ynode(Cell, j, grid)
@inline yF(j, grid) = ynode(Face, j, grid)
@inline zC(k, grid) = znode(Cell, k, grid)
@inline zF(k, grid) = znode(Face, k, grid)

all_x_nodes(::Type{Cell}, grid) = grid.xC
all_x_nodes(::Type{Face}, grid) = grid.xF
all_y_nodes(::Type{Cell}, grid) = grid.yC
all_y_nodes(::Type{Face}, grid) = grid.yF
all_z_nodes(::Type{Cell}, grid) = grid.zC
all_z_nodes(::Type{Face}, grid) = grid.zF


"""
    xnodes(loc, grid, reshape=false)
Returns a view over the interior `loc=Cell` or `loc=Face` nodes on `grid` in the
x-direction. For `Bounded` directions, `Face` nodes include the boundary points.
`reshape=false` will return a 1D array, while `true` will return a 3D array with size Nx x 1 x 1
"""
function xnodes(loc, grid; reshape=false)
  x = view(all_x_nodes(loc, grid), 
           interior_indices(loc, topology(grid, 1), grid.Nx))
  reshape ? Base.reshape(x, length(x), 1, 1) : x
end


"""
    ynodes(loc, grid, reshape=false)
Returns a view over the interior `loc=Cell` or `loc=Face` nodes on `grid` in the
y-direction. For `Bounded` directions, `Face` nodes include the boundary points.
`reshape=false` will return a 1D array, while `true` will return a 3D array with size 1 x Ny x 1
"""
function ynodes(loc, grid; reshape=false)
  y = view(all_y_nodes(loc, grid), 
           interior_indices(loc, topology(grid, 2), grid.Ny))
  reshape ? Base.reshape(y, 1, , length(y), 1) : y
end


"""
    znodes(loc, grid, reshape=false)
Returns a view over the interior `loc=Cell` or `loc=Face` nodes on `grid` in the
z-direction. For `Bounded` directions, `Face` nodes include the boundary points.
`reshape=false` will return a 1D array, while `true` will return a 3D array with size 1 x 1 x Nz
"""