module Grids


export
  AbstractGrid, RegularCartesianGrid



include("regular_cartesian_grid.jl")


"""
  AbstractGrid{FT, TX, TY, TZ}
Abstract supertype for grids with elements of type `FT` and topology 
`{TX, TY, TZ}`.
"""
abstract type AbstractGrid{FT, TX, TY, TZ} end

end # module