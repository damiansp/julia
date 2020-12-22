module Oceananigans


if VERSION < v"1.5"
  error("This version of Oceananigans requires Julia 1.5 or newer.")
end


export
  # Grids
  RegularCartesianGrid


# Inclde all submodules
include("Grids/Grids.jl")


# Re-export stuff from submodules
using .Grids


end # module