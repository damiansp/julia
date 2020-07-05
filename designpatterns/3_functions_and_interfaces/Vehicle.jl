module Vehicle
# 1. Im/Exports
export go!


# 2. Interface Documentation
# A vehicle (v) must implement the following functions:
#
# poweron!(v) - turn on the vehicle's engine
# poweroff!(v) - turn off the vehicle's engine
# turn!(v, direction) - steer the vehicle to the specified direction 
# move!(v, distance) - move the vehicle by the specified distance
# getposition(v) - returns the (x,y) position of the vehicle
# engagewheels!(v) - engage wheels for landing (Optional)


# 3. Generic Defs for Interface
# Hard contracts
"""
Power on the vehicle so it is ready to go
"""
function poweron! end

"""
Etc
"""
function poweroff! end
function turn! end
function move! end
function getposition end

# Soft contracts
engagewheels!(args...) = nothing


# 4. Game Logic
# Returns a travel plan from current position to destination
function travelpath(position, destination)
	return round(π / 6, digits=2), 1000 # test only
end

# Space travel logic
function go!(vehicle, destination)
	poweron!(vehicle)
	direction, distance = travelpath(getposition(vehicle), destination)
	turn!(vehicle, direction)
	move!(vehicle, distance)
	poweroff!(vehicle)
	nothing
end  # module

# Landing
function land!(vehicle)
	engagewheels!(vehicle)
	println("Landing vehicle: ", vehicle)
end