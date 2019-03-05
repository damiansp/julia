module TemperatureConverter


function as_celsius(temp, unit)
    if unit == :Celsius
        return temp
    elseif unit == :Kelvin
        return kelvin_to_celsius(temp)
    end
end


# 'private' function
function kelvin_to_celsius(temp)
    return temp + 273
end


end
