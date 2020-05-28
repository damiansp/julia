using InteractiveUtils

abstract type Asset end

abstract type Property <: Asset end
abstract type Investment <: Asset end
abstract type Cash <: Asset end

abstract type House <: Property end
abstract type Apartment <: Property end

abstract type Bond <: Investment end
abstract type Equity <: Investment end


println(subtypes(Asset))   # Cash, Investment, Property
println(supertype(Equity)) # Investment


# Display the entire type hierarchy starting from the specified roottype
function showsubtypetree(roottype, level=1, indent=2)
	level == 1 && println(roottype)
	for s in subtypes(roottype)
		println(join(fill(" ", level * indent)) * string(s))
		showsubtypetree(s, level + 1, indent)
	end
end

showsubtypetree(Asset)


# Simple functions on abstract types
describe(a::Asset) = "Something of value"
describe(e::Investment) = "Financial investment"
describe(e::Property) = "Physical property"

#println(describe(House)) # throws error--perhaps an instance would work???



# Functional Behavior
"""
 location(p::Property)
 
 Returns the location of a property as (lat, lon)
 """
 location(p::Property) = error("Location is not defined on the concrete type")

 # Can also define as an empty func:
function location2(p::Property) end



# Interaction between objects
function walkingdistance(p1::Property, p2::Property)
	# "walking distance" is Manhattan distance
	loc1 = location(p1)
	loc2 = location(p2)
	return abs(loc1.x - loc2.x) + abs(loc1.y - loc2.y)
end



# Designing composite types
struct Stock <: Equity
	symbol::String
	name::String
end

function describe(s::Stock)
	return s.symbol * "(" * s.name * ")"
end

stock = Stock("AAPL", "Apple, Inc.")
println(describe(stock))