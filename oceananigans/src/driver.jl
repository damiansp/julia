include("./Oceananigans.jl")


grid = RegularCartesianGrid(size=(100, 100, 50), extent=(2π, 2π, 1))
#model = IncompressibleModel(grid=grid)
#simulation = Simulation(model, deltat=60, stop_time=3600)
#run!(simulation)