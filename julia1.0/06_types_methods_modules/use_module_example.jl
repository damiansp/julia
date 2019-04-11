include("module_example.jl")


println("$(TemperatureConverter.as_celsius(100, :Celsius))")
println("$(TemperatureConverter.as_celsius(100, :Kelvin))")
println("$(TemperatureConverter.kelvin_to_celsius(0))") # accessible
