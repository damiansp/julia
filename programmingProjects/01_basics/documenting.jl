"""
    thermal_confort(temperature, humidity; <keyword arguments>)
Compute the thermal confort index based on temperature and humidity.  It can 
optionally take into account the age of the patient.  Work with both Celsius and
Fahrenheit.

# Examples:
```julia-repl
julia> thermal_confort(32, 78)
12
```

# Arguments
- temperature: the current air temperature
- humidity: the current air humidity
- scale: :celsius (default) or :fahrenheit
- age: the age of the patient
"""
function thermal_confort(temperature, humidity; scale=:celsius, age=35)
    println("Not actually implemented")
end


# In REPL:
#help?> thermal_confort
