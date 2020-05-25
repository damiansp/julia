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
		subtypetree(s, level + 1, indent)
	end
end

showsubtypetree(Asset)


# Simple functions on abstract types
describe(a::Asset) = "Something of value"
describe(e::Investment) = "Financial investment"
describe(e::Property) = "Physical property"

println(describe(House)) 